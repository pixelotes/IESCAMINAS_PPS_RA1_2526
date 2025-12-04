#!/bin/bash

# Obtener el usuario actual con el comando whoami
USUARIO=$(whoami)

# Obtener el nombre del equipo con el comando hostname
EQUIPO=$(hostname)

# Obtener el Sistema Operativo
if [ -f /etc/os-release ]; then
    # Extraemos la variable PRETTY_NAME del archivo os_release
    SO=$(grep '^PRETTY_NAME=' /etc/os-release | cut -d= -f2- | tr -d '"')
else
    # Fallback por si el sistema es muy antiguo
    SO=$(uname -sr)
fi

# Obtener la dirección MAC
# Snippet obtenido en https://stackoverflow.com/questions/23828413/get-mac-address-using-shell-script
MAC=$(cat /sys/class/net/$(ip route show default | awk '/default/ {print $5}')/address)

# Si no encuentra MAC mostramos un mensaje
if [ -z "$MAC" ]; then
    MAC="No detectada"
fi

# Imprimir el mensaje con todos los datos
echo "------------------------------------------------------------------"
echo "Hola $USUARIO. Estás operando en el equipo '$EQUIPO'"
echo "Sistema Operativo detectado: $SO"
echo "Dirección MAC principal: $MAC"
echo "------------------------------------------------------------------"