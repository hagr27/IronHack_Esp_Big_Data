# ------------------------------------------------------------------
# Terraform Configuration: AWS Provider
# ------------------------------------------------------------------
# Propósito:
# Configura el proveedor de AWS y establece las versiones requeridas
# de Terraform y del proveedor. Todos los recursos creados usarán
# esta configuración por defecto.
# ------------------------------------------------------------------

terraform {
  # Definición de proveedores requeridos para este proyecto
  required_providers {
    aws = {
      source  = "hashicorp/aws" # Ubicación del proveedor en HashiCorp Registry
      version = "~> 5.0"        # Asegura compatibilidad con la versión 5.x del proveedor
    }
  }

  # Versión mínima de Terraform requerida para este proyecto
  required_version = ">= 1.5.0"
}

# ------------------------------------------------------------------
# Proveedor AWS
# ------------------------------------------------------------------
# Propósito:
# Configura la región de AWS donde se crearán los recursos y
# establece etiquetas por defecto para todos los recursos gestionados.
# ------------------------------------------------------------------
provider "aws" {
  # Región de AWS donde se desplegarán los recursos
  region = var.aws_region

  # Etiquetas por defecto aplicadas a todos los recursos
  default_tags {
    tags = {
      Project = "IronHack" # Etiqueta de proyecto para gestión y reportes
    }
  }
}
