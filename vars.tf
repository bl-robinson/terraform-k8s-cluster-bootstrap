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
