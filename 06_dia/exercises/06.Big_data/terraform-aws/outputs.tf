# ------------------------------------------------------------------
# Outputs de Terraform
# ------------------------------------------------------------------
# Propósito:
# Definir valores de salida que serán visibles después de aplicar
# la infraestructura con `terraform apply`. Estos outputs permiten
# obtener información útil de los recursos creados.
# ------------------------------------------------------------------

# Nombre del bucket S3 creado
output "s3_bucket_name" {
  description = "Nombre del bucket S3"
  value       = aws_s3_bucket.mi_bucket.id
}

# IP pública de la instancia EC2
output "ec2_public_ip" {
  description = "IP pública de la instancia EC2"
  value       = aws_instance.mi_ec2.public_ip
}

# Nombre de la key pair asociada a la EC2
output "key_pair_name" {
  description = "Nombre de la key pair usada por la EC2"
  value       = aws_key_pair.ironhack_key.key_name
}

output "ec2_users" {
  description = "Lista de usuarios creados en la EC2"
  value       = var.ec2_users
}
