import unittest
from validador import es_contrasena_segura

class TestValidadorContrasena(unittest.TestCase):
    
    # Test 1: Comprobar que falla si la contraseña es muy corta
    def test_longitud_insuficiente(self):
        self.assertFalse(es_contrasena_segura("Ab1!"), "Debería fallar con menos de 8 caracteres")

    # Test 2: Comprobar que falla si la contraseña no tiene números
    def test_sin_numeros(self):
        self.assertFalse(es_contrasena_segura("Password!"), "Debería fallar si no tiene números")

    # Test 3: Comprobar que falla si la contraseña no tiene caracteres especiales
    def test_sin_caracter_especial(self):
        self.assertFalse(es_contrasena_segura("Password123"), "Debería fallar si no tiene caracteres especiales")

    # Test 4: Comprobar una contraseña válida que cumple todo
    def test_contrasena_valida(self):
        self.assertTrue(es_contrasena_segura("S3guridad!"), "Debería ser válida con todos los requisitos")

if __name__ == '__main__':
    unittest.main()