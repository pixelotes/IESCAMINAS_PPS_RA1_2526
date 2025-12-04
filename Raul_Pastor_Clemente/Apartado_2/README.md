# Práctica Puntuable RA1 - Apartado 2

## Enunciado
Crea un **script en bash** que nos permita obtener:

- La **MAC** del equipo en el que se lanza.  
- El **sistema operativo** concreto en el que se ejecuta el script.  
- El **nombre del equipo** desde el que se lanza y el **usuario** que ha lanzado el script.

Todos estos datos deben verse en un **mensaje único** que los contenga a todos ellos en la consola.

## Qué hace el script y explicación
El script `info_sistema.sh` utiliza comandos nativos de sistemas Linux para extraer la información del equipo.

La lógica de extracción es la siguiente:
1.  **Usuario y Hostname**: Se utilizan los comandos estándar `whoami` y `hostname`.
2.  **Sistema Operativo**: En lugar de usar `uname`, que solo devuelve el kernel, el script lee `/etc/os-release` para obtener el nombre completo de la distribución.
3.  **Dirección MAC**: Se inspeccionan las interfaces de red mediante `ip link`. Se filtra la salida para encontrar la primera interfaz física activa (`link/ether`) y se extrae su dirección hexadecimal mediante `awk`.

## Cómo ejecutar

### 1. Asignar permisos de ejecución
Antes de lanzarlo por primera vez, es necesario otorgar permisos de ejecución al archivo:

```bash
chmod +x info_sistema.sh
```

### 2. Lanzar el script

Ejecuta el script directamente desde la terminal:

```bash
./info_sistema.sh
```

## Salida esperada

El script imprimirá un bloque informativo similar a este:

```bash
------------------------------------------------------------------
Hola raul. Estás operando en el equipo 'raul-latitude9430'.
Sistema Operativo detectado: Ubuntu 25.10
Dirección MAC principal: 84:7b:57:46:1e:23
------------------------------------------------------------------
```

## Conclusión

La automatización de tareas con Bash es una habilidad esencial en administración de sistemas. Este script demuestra cómo interactuar con el sistema de archivos (/etc/) y filtrar salidas de comandos complejos (ip link + awk) para presentar información legible al usuario , lo cual puede resultar útil para inventariado o diagnósticos rápidos.