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
