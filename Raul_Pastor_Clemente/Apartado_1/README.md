# Práctica Puntuable RA1 - Apartado 1

## Enunciado
Crea una app sencilla utilizando el lenguaje **Python** con temas relacionados con la **ciberseguridad** como puede ser la **criptografía**, por ejemplo.  
Realiza **4 test unitarios** para esta app.

## Qué hace el script y explicación
El script `validador.py` consiste en una herramienta de seguridad diseñada para auditar la fortaleza de contraseñas. Su función principal es validar si una cadena de texto cumple con los estándares mínimos de complejidad para resistir ataques básicos de fuerza bruta o diccionario.

La función `es_contrasena_segura` verifica que la entrada cumpla simultáneamente con las siguientes reglas mediante expresiones regulares:

1.  **Longitud:** Mínimo 8 caracteres.
2.  **Complejidad:**
    * Debe contener al menos una letra mayúscula.
    * Debe contener al menos un dígito numérico.
    * Debe contener al menos un carácter especial (signos de puntuación o símbolos).

El script devuelve un valor booleano (`True`/`False`) dependiendo de si se satisfacen todas las condiciones.

## Cómo ejecutar
El proyecto utiliza librerías estándar de Python, por lo que no requiere instalación de dependencias para la ejecución del script principal.

Para ejecutar la comprobación manual:

```bash
python validador.py
```

El programa solicitará una contraseña por consola y mostrará un mensaje indicando si es segura o no.

## Cómo lanzar las pruebas

El archivo test_validador.py contiene 4 casos de prueba diseñados para validar cada una de las reglas de negocio (longitud, números, mayúsculas y caracteres especiales).

Para una ejecución detallada de los tests, se recomienda utilizar pytest.
### 1. Instalación de pytest

Si no está instalado en el sistema, se puede instalar mediante pip:

```bash
pip install pytest
```

### 2. Ejecución de los tests

Para lanzar las pruebas y obtener un reporte detallado (flag --verbose), ejecuta el siguiente comando en la terminal dentro de esta carpeta:

```bash
pytest test_validador.py --verbose
```

Una salida exitosa mostrará los 4 tests en estado PASSED.

## Conclusión

La validación de credenciales en el lado del servidor es un control de seguridad fundamental. Este script demuestra cómo implementar políticas de contraseñas robustas de forma programática, asegurando que los usuarios no utilicen claves triviales. La inclusión de pruebas unitarias garantiza que estas reglas de seguridad se mantengan íntegras ante futuros cambios en el código.