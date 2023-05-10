module "playground" {
  source                          = "./modules/vm"
  module_name                     = "playground"
  vm_id                           = var.playground_vm_id
  target_node                     = var.target_nodes[0]
  public_key_file                 = var.playground_public_key_file
  private_key_file                = var.playground_private_key_file
  template                        = var.playground_template
  user                            = var.playground_user
  cpu_count                       = var.playground_cpu_count
  memory                          = var.playground_memory
  hostname                        = var.playground_hostname
  ipv4_gateway                    = var.playground_ipv4_gateway
  ipv4                            = var.playground_ipv4
  ipv4_data                       = var.playground_ipv4_data
  disk_size                       = var.playground_disk_size
  disk_storage                    = var.playground_disk_storage
  dots_ansible_repo               = var.playground_ansible_repo
  glusterfs_mounts                = var.playground_glusterfs_mounts
  glusterfs_server                = var.glusterfs_server
  config_files                    = var.playground_config_files
}

module "bootstrap" {
  source                          = "./modules/vm"
  module_name                     = "bootstrap"
  vm_id                           = var.bootstrap_vm_id
  target_node                     = var.target_nodes[0]
  public_key_file                 = var.bootstrap_public_key_file
  private_key_file                = var.bootstrap_private_key_file
  template                        = var.bootstrap_template
  user                            = var.bootstrap_user
  cpu_count                       = var.bootstrap_cpu_count
  memory                          = var.bootstrap_memory
  hostname                        = var.bootstrap_hostname
  ipv4_gateway                    = var.bootstrap_ipv4_gateway
  ipv4                            = var.bootstrap_ipv4
  ipv4_data                       = var.bootstrap_ipv4_data
  disk_size                       = var.bootstrap_disk_size
  disk_storage                    = var.bootstrap_disk_storage
  dots_ansible_repo               = var.bootstrap_ansible_repo
  glusterfs_mounts                = var.bootstrap_glusterfs_mounts
  glusterfs_server                = var.glusterfs_server
  config_files                    = var.bootstrap_config_files
}


module "media" {
  source                          = "./modules/vm"
  module_name                     = "media"
  vm_id                           = var.media_vm_id
  target_node                     = var.target_nodes[0]
  public_key_file                 = var.media_public_key_file
  private_key_file                = var.media_private_key_file
  template                        = var.media_template
  user                            = var.media_user
  cpu_count                       = var.media_cpu_count
  memory                          = var.media_memory
  hostname                        = var.media_hostname
  ipv4_gateway                    = var.media_ipv4_gateway
  ipv4                            = var.media_ipv4
  ipv4_data                       = var.media_ipv4_data
  disk_size                       = var.media_disk_size
  disk_storage                    = var.media_disk_storage
  dots_ansible_repo               = var.media_ansible_repo
  glusterfs_mounts                = var.media_glusterfs_mounts
  glusterfs_server                = var.glusterfs_server
  config_files                    = var.media_config_files
}


# TODO: Get this working
resource "null_resource" "cleanup" {
  depends_on = [
    module.playground,
    module.bootstrap
  ]
  # Cleanup on destroy
  provisioner "local-exec" {
    when = destroy
    command = <<EOT
    #!/usr/bin/env bash
    bash -x scripts/cleanup.sh
    EOT
  }
}