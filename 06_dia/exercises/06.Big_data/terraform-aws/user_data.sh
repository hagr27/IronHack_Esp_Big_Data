#!/bin/bash

# ------------------------------------------------------------------
# Script User Data para EC2
# ------------------------------------------------------------------
# Propósito:
# Configurar las claves SSH autorizadas para el usuario ec2-user
# al iniciar la instancia EC2. Este script se ejecuta automáticamente
# al lanzar la instancia mediante Terraform.
# ------------------------------------------------------------------

# Iterar sobre la lista de usuarios y crear cada uno
%{ for user in ec2_users ~}
useradd -m -s /bin/bash ${user}
mkdir -p /home/${user}/.ssh
chmod 700 /home/${user}/.ssh
> /home/${user}/.ssh/authorized_keys

# Agregar claves SSH de Terraform
%{ for key in ssh_keys ~}
echo "${key}" >> /home/${user}/.ssh/authorized_keys
%{ endfor ~}

chmod 600 /home/${user}/.ssh/authorized_keys
chown -R ${user}:${user} /home/${user}/.ssh
%{ endfor ~}
