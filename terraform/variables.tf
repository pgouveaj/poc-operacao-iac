variable "imagem" {
  description = "Imagem utilizada no container"
  type        = string
  default     = "nginx:latest"
}

variable "nome_container" {
  description = "Nome do container"
  type        = string
  default     = "poc-operacao-iac"
}

variable "porta_externa" {
  description = "Porta para acessar a aplicação"
  type        = number
  default     = 8000
}