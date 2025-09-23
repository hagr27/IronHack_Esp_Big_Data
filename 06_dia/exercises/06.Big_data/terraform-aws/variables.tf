# ------------------------------------------------------------------
# Variables de configuración para Terraform
# ------------------------------------------------------------------
# Propósito:
# Definir parámetros reutilizables y configurables para la
# infraestructura AWS, tales como región, tipo de instancia,
# AMI, bucket S3 y claves SSH.
# ------------------------------------------------------------------

# Región de AWS donde se desplegarán los recursos
variable "aws_region" {
  description = "Región de AWS"
  default     = "eu-north-1"
}

# Tipo de instancia EC2 a utilizar
variable "ec2_instance_type" {
  description = "Tipo de instancia EC2"
  default     = "t3.micro"
}

# AMI (Amazon Machine Image) para lanzar la instancia EC2
variable "ec2_ami" {
  description = "AMI para la instancia EC2"
  default     = "ami-043339ea831b48099" # Amazon Linux 2 (eu-north-1)
}

# Nombre del bucket S3 que se creará
variable "s3_bucket_name" {
  description = "Nombre del bucket S3"
  default     = "ironhack-bucket-terraform-ag-1"
}

# Lista de claves públicas autorizadas para conectarse a la EC2
variable "ssh_public_keys" {
  description = "Lista de claves públicas autorizadas para conectarse a la EC2"
  type        = list(string)
  default     = [
    "~/.ssh/id_rsa.pub"  # clave principal
  ]
}

# Lista de usuarios que se crearán en la EC2
variable "ec2_users" {
  description = "Usuarios que serán creados en la EC2"
  type        = list(string)
  default     = [
    "ec2-user01" # Usuario Uno
  ]
}
