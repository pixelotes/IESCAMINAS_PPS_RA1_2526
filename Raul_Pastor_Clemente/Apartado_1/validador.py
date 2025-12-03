import re

# Verifica si una contraseña es segura basándose en políticas comunes
def es_contrasena_segura(password):
    
    # Verifica si cumple con una longitud mínima de 8
    if len(password) < 8:
        return False
    
    # Verifica si tiene al menos una letra mayúscula
    if not re.search(r"[A-Z]", password):
        return False
        
    # Verifica si tiene al menos un dígito numérico
    if not re.search(r"\d", password):
        return False
        
    # Verifica si tiene al menos un carácter especial (no alfanumérico)
    if not re.search(r"[!@#$%^&*(),.?\":{}|<>]", password):
        return False
        
    return True

# Bloque main, salta si el archivo se ejecuta manualmente.
if __name__ == "__main__":
    pwd = input("Introduce una contraseña para verificar: ")
    if es_contrasena_segura(pwd):
        print("La contraseña es segura.")
    else:
        print("La contraseña NO es segura.")