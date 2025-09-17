# double_v_partners_jorge_test

Prueba técnica desarrollador Flutter para Double V Partners.

App intuitiva para creación y eliminación de usuarios.

## Tecnología

> Flutter 3.35.4 • channel stable - Tools • Dart 3.9.2 • DevTools 2.48.0

> Principios SOLID.


## Arquitectura

El proyecto se organiza en un sistema de carpetas robusto y lógico, manteniendo características marcadas del patrón MVC, priorizando la legibilidad, el mantenimiento y la extensión de funcionalidades.

## Enrutador

**GoRouter** fue seleccionado para la navegación entre pantallas. Permite navegar de una forma más estandarizada, pudiendo enviar **path_parameters**, **query_parameters**, entre otras cosas; facilitando la legibilidad, performance y build del app según la lógica de negocio.

## State Management

Se implemtentan dos manejadores de estados de **Riverpod**. Uno para mantener en caché los usuarios, y otro para el enrutamiento global del app, con el fin de mantener centralizada y limpia la navegación entre pantallas.


## Resumen

 - Se han implementados prácticas de alto nivel para mantener un desempeño top del app según la lógica de negocio. 
 - Enrutadores y manejadores de estado bien estructurados para un escalamiento del proyecto sin tropiezos.



> Jorge Ramos Arellano.
