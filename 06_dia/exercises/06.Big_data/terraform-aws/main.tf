# ------------------------------------------------------------------
# Terraform main.tf
# ------------------------------------------------------------------
# Propósito:
# Crear la infraestructura básica en AWS que incluye:
# - S3 Bucket con versionado
# - IAM Role y Policy para EC2 con acceso a S3
# - Security Group para EC2 (SSH)
# - Key Pair para acceso SSH
# - Instancia EC2 con las claves SSH autorizadas
# ------------------------------------------------------------------

# Obtener la VPC por defecto
data "aws_vpc" "default" {
  default = true
}

# ------------------------------------------------------------------
# Crear S3 Bucket
# ------------------------------------------------------------------
resource "aws_s3_bucket" "mi_bucket" {
  bucket = var.s3_bucket_name

  force_destroy = true  # elimina todos los objetos y versiones al destruir
}

# Habilitar versionado en el bucket
resource "aws_s3_bucket_versioning" "mi_bucket_versioning" {
  bucket = aws_s3_bucket.mi_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

# ------------------------------------------------------------------
# Crear Key Pair para EC2 usando la primera clave de la lista
# ------------------------------------------------------------------
resource "aws_key_pair" "ironhack_key" {
  key_name   = "ironhack-key"
  public_key = file(var.ssh_public_keys[0])
}

# ------------------------------------------------------------------
# IAM Role para EC2 con acceso a S3
# ------------------------------------------------------------------
resource "aws_iam_role" "ec2_role" {
  name = "ec2_s3_access_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

# Policy para acceso completo al bucket S3
resource "aws_iam_policy" "s3_access_policy" {
  name        = "S3FullAccessPolicy"
  description = "Permite a EC2 acceder al bucket S3"
  policy      = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = ["s3:*"]
        Effect   = "Allow"
        Resource = [
          aws_s3_bucket.mi_bucket.arn,
          "${aws_s3_bucket.mi_bucket.arn}/*"
        ]
      }
    ]
  })
}

# Asociar la policy al role
resource "aws_iam_role_policy_attachment" "ec2_attach_policy" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = aws_iam_policy.s3_access_policy.arn
}

# ------------------------------------------------------------------
# Security Group para EC2 (permite SSH desde cualquier IP)
# ------------------------------------------------------------------
resource "aws_security_group" "ec2_sg" {
  name        = "ec2-security-group"
  description = "Permite SSH"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# ------------------------------------------------------------------
# Instance Profile para EC2 (para asociar IAM Role)
# ------------------------------------------------------------------
resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = "ec2_instance_profile"
  role = aws_iam_role.ec2_role.name
}

# ------------------------------------------------------------------
# Instancia EC2
# ------------------------------------------------------------------
resource "aws_instance" "mi_ec2" {
  ami                  = var.ec2_ami
  instance_type        = var.ec2_instance_type
  key_name             = aws_key_pair.ironhack_key.key_name
  security_groups      = [aws_security_group.ec2_sg.name]
  iam_instance_profile = aws_iam_instance_profile.ec2_instance_profile.name

  # Script para agregar todas las claves SSH al authorized_keys
  user_data = templatefile("${path.module}/user_data.sh", {
  ssh_keys  = [for key in var.ssh_public_keys : file(key)]
  ec2_users = var.ec2_users
})

  tags = {
    Name = "EC2-IronHack"
  }
}
