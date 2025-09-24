#!/bin/bash

# ------------------------------------------------------------------
# Script User Data para EC2
# ------------------------------------------------------------------
# Propósito:
# Crear usuarios, configurar SSH, instalar Docker y Jupyter Notebook
# ------------------------------------------------------------------

# Actualizar paquetes e instalar dependencias
yum update -y
amazon-linux-extras enable python3.9
yum install -y python3 git unzip curl vim

# Instalar pip y Jupyter
python3 -m ensurepip
python3 -m pip install --upgrade pip
python3 -m pip install notebook

# Instalar Docker
amazon-linux-extras install docker -y
service docker start
systemctl enable docker

# Iterar sobre la lista de usuarios y crear cada uno
%{ for user in ec2_users ~}
useradd -m -s /bin/bash ${user}

# SSH
mkdir -p /home/${user}/.ssh
chmod 700 /home/${user}/.ssh
> /home/${user}/.ssh/authorized_keys

# Agregar claves SSH de Terraform
%{ for key in ssh_keys ~}
echo "${key}" >> /home/${user}/.ssh/authorized_keys
%{ endfor ~}
chmod 600 /home/${user}/.ssh/authorized_keys
chown -R ${user}:${user} /home/${user}/.ssh

# Agregar al grupo docker
usermod -aG docker ${user}

# Crear carpeta para notebooks
mkdir -p /home/${user}/notebooks
chown -R ${user}:${user} /home/${user}/notebooks

# Crear archivo de configuración de Jupyter Notebook
sudo -u ${user} bash -c "mkdir -p /home/${user}/.jupyter && echo 'c.NotebookApp.ip = \"0.0.0.0\"\nc.NotebookApp.open_browser = False\nc.NotebookApp.port = 8888' > /home/${user}/.jupyter/jupyter_notebook_config.py"

%{ endfor ~}
