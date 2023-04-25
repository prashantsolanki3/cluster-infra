resource "proxmox_vm_qemu" "dev" {
  name        = var.hostname
  target_node = var.target_node
  vmid        = var.vm_id
  clone       = var.template
  agent       = 1
  os_type     = "cloud-init"
  cores       = var.cpu_count
  sockets     = 1
  cpu         = "host"
  memory      = var.memory
  scsihw      = "virtio-scsi-pci"
  bootdisk    = "scsi0"
  depends_on  = [null_resource.git_clone, local_file.module_info]

  disk {
    slot     = 0
    size     = var.disk_size
    type     = "scsi"
    storage  = var.disk_storage
    iothread = 1
  }

  network {
    model  = "virtio"
    bridge = "vmbr0"
  }

  network {
    model  = "virtio"
    bridge = "vmbr1"
  }

  lifecycle {
    ignore_changes = [
      network,
    ]
  }

  ipconfig0 = "ip=${var.ipv4}/24,gw=${var.ipv4_gateway}"
  ipconfig1 = "ip=${var.ipv4_data}/24"

  sshkeys = <<EOF
  ${file(var.public_key_file)}
  EOF

  connection {
    type        = "ssh"
    user        = var.user
    private_key = file(var.private_key_file)
    host        = var.ipv4
  }

  # This helps to wait and test connection before executing local commands.
  provisioner "remote-exec" {
    inline = [
      "date",
      "sleep 10"
    ]
  }

  # Remove Existing ssh fingerprint
  # TODO: Fix ipv4 not found
  provisioner "local-exec" {
    command = <<EOT
    #!/bin/bash

    # Read key-value pairs from file and store in associative array
    declare -A pairs

    while IFS='=' read -r key value; do
        pairs["$key"]="$value"
    done < ./.dots/${var.module_name}_module_info

    ssh-keygen -f ~/.ssh/known_hosts -R $pairs["ipv4"]
    EOT
  }
}

resource "null_resource" "git_clone" {
  # Clone Dots Ansible Project
  provisioner "local-exec" {
    command = <<EOT
    git clone ${var.dots_ansible_repo} .dots/${var.module_name}_ansible
    cd .dots/${var.module_name}_ansible
    git checkout ${var.module_name}
    EOT
  }
}

resource "null_resource" "ansible" {
  depends_on = [null_resource.git_clone, local_file.ansible_hosts, local_file.host_vars, proxmox_vm_qemu.dev]
  # Run Ansible Playbook
  provisioner "local-exec" {
    command = "cd ./.dots && ansible-playbook -i ${var.module_name}_hosts ${var.module_name}_ansible/ubuntu.yml"
  }
}
