variable "pm_api_token_id" {
  description = "PM_API_TOKEN_ID"
  type        = string
}

variable "pm_api_token_secret" {
  description = "PM_API_TOKEN_SECRET"
  type        = string
}

variable "proxmox_ip" {
  description = "PROXMOX_IP"
  type        = string
}

variable "target_nodes" {
  description = "TARGET_NODES"
  type        = list(string)
}

variable "playground_vm_id" {
  description = "Proxmox vm id"
  type        = string
}

variable "playground_public_key_file" {
  description = "public_key"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

variable "playground_private_key_file" {
  description = "private_key_file"
  type        = string
  default     = "~/.ssh/id_rsa"
}

variable "playground_template" {
  description = "Template Name"
  type        = string
  default     = "U2004-DOCKER-TEMPLATE"
}

variable "playground_user" {
  description = "Username"
  type        = string
}

variable "playground_cpu_count" {
  description = "cpu_count"
  type        = number
  default     = 4
}

variable "playground_memory" {
  description = "Memory"
  type        = number
  default     = 4096
}

variable "playground_hostname" {
  description = "Hostname"
  type        = string
  default     = "dev-box"
}

variable "playground_ipv4_gateway" {
  description = "Default Gateway"
  type        = string
}

variable "playground_ipv4" {
  description = "The ipv4"
  type        = string
  default     = "10.2.21.12"
}

variable "playground_ipv4_data" {
  description = "The ipv4 data network"
  type        = string
  default     = "10.2.21.12"
}

variable "playground_disk_size" {
  description = "Disk size"
  type        = string
  default     = "32G"
}

variable "playground_disk_storage" {
  description = "storage location"
  type        = string
  default     = "local-lvm"
}

variable "playground_ansible_repo" {
  description = "Point to you ansible based dot repo"
  type = string
  default = "https://github.com/prashantsolanki3/dots.git"
}

variable "glusterfs_server" {
  description = "Glusterfs server"
  type        = string
}

variable "playground_glusterfs_mounts" {
  description = "GlusterFS mounts"
  type        = list(string)
}

variable "bootstrap_glusterfs_mounts" {
  description = "GlusterFS mounts"
  type        = list(string)
}

variable "bootstrap_vm_id" {
  description = "Proxmox vm id"
  type        = string
}

variable "bootstrap_public_key_file" {
  description = "public_key"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

variable "bootstrap_private_key_file" {
  description = "private_key_file"
  type        = string
  default     = "~/.ssh/id_rsa"
}

variable "bootstrap_template" {
  description = "Template Name"
  type        = string
  default     = "U2004-DOCKER-TEMPLATE"
}

variable "bootstrap_user" {
  description = "Username"
  type        = string
}

variable "bootstrap_cpu_count" {
  description = "cpu_count"
  type        = number
  default     = 4
}

variable "bootstrap_memory" {
  description = "Memory"
  type        = number
  default     = 4096
}

variable "bootstrap_hostname" {
  description = "Hostname"
  type        = string
  default     = "dev-box"
}

variable "bootstrap_ipv4_gateway" {
  description = "Default Gateway"
  type        = string
}

variable "bootstrap_ipv4" {
  description = "The ipv4"
  type        = string
  default     = "10.2.21.12"
}

variable "bootstrap_ipv4_data" {
  description = "The ipv4 data network"
  type        = string
  default     = "10.2.21.12"
}

variable "bootstrap_disk_size" {
  description = "Disk size"
  type        = string
  default     = "32G"
}

variable "bootstrap_disk_storage" {
  description = "storage location"
  type        = string
  default     = "local-lvm"
}

variable "bootstrap_ansible_repo" {
  description = "Point to you ansible based dot repo"
  type = string
  default = "https://github.com/prashantsolanki3/dots.git"
}