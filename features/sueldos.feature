# language: es
Característica: Sueldos
  Test de Sueldos

  Esquema del escenario: Empleados
    Dado que ingreso empleados a la empresa '<empleado>''<nombre>''<hora>''<cantidad>'
    Entonces debo calcular


     Ejemplos: Datos Personales
    |  empleado     |   nombre  |   hora     |  cantidad    |
    |  Peon         |   juan    |  300       |  100         |
    |  Peon         |  jose     |  300       |  120         |
    |  Captaz       |  lucas    |  300       |  130         |
    |  MedioOficial |  roberto  |  300       |  100         |
    |  Captaz       |  martin   |  300       |  100         |
    |  Oficial      |  rodrigo  |  300       |  120         |
    |  Oficial      |  german   |  300       |  100         |
