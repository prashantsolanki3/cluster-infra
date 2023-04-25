provider "proxmox" {
  pm_api_url          = "https://${var.proxmox_ip}:8006/api2/json"
  pm_api_token_id     = var.pm_api_token_id
  pm_api_token_secret = var.pm_api_token_secret
  pm_tls_insecure     = true
  pm_debug            = true
}

provider "local" {

}

provider "null" {
  
}