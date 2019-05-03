# Registro de cambios
Sistema de archivos administrativos - plantillas formly.

## [1.2.0] - 2017-03-16
### Agregado
- API para la integración con el sistema de control de personal.

### Corregido
- Parámetros de configuración del sistema
- Filtro de búsqueda de usuarios

## [1.1.0] - 2017-02-22
### Agregado

- Modelo de datos para registrar la visitas denominado monitoréo.
- Servicios REST:
    - Reporte de documentos mas vistos por mes.
    - Reporte de usuarios que mas documentos ven.
    - Reporte de documentos mas vistos.
    - Reporte de documentos con cite mas vistos por un usuario en especifico.

### Modificado
- Servicios de aprobación y derivación, donde ahora se realiza el registro de la visita.
- Servicios de aprobación y cierre, donde ahora se realiza el registro de la visita.
- Servicio de obtención del documento por identificador, donde ahora se registra la visita
- La forma de uso de identificadores de dirección y director, estos ahora se deben agregar en el archivo configuración.
- Se debe agregar una sola vez en el archivo de configuración, los parámetros de cite_ceros (define la cantidad de dígitos numéricos que posee el cite) y cite_principal (define el cite guía principal).

### Corregido
- Test's unitarios para cada endpoint(Servicios REST)



[1.1.0]: https://gitlab.geo.gob.bo/agetic/plantillas-formly-backend/commits/plantillas-formly_v1.1.0

[1.2.0]:https://gitlab.geo.gob.bo/agetic/plantillas-formly-backend/commits/plantillas-formly_v1.2.0
