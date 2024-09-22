variable "github_token" {
  description = "The github token to use for flux access."
  type = string
  sensitive = true
}

variable "github_token_classic" {
  description = "The github token to use for github action runner controller."
  type = string
  sensitive = true
}

variable "sendgrid_sec" {
  description = "Api key from sendgrid"
  type = string
  sensitive = true
}

variable "initial_mail_user_pass" {
  description = "Initial mail user password"
  type = string
  sensitive = true
}

variable "foundry_license_key" {
  description = "Foundry VTT license key"
  type = string
  sensitive = true
}

variable "foundry_admin_password" {
  description = "Foundry VTT Admin password"
  type = string
  sensitive = true
}