# Vale Vet Agenda

Web funcional para agenda veterinaria y fichas clínicas usando GitHub Pages + Supabase.

## Archivos
- `index.html`: aplicación principal
- `config.js`: credenciales públicas del proyecto Supabase
- `schema.sql`: tablas y políticas base

## Qué hace
- Agenda pública de horas
- Login por magic link
- Panel privado para ver reservas
- Cambio de estado de reservas
- Registro de casos clínicos

## Cómo dejarlo funcionando
1. Crea un proyecto en Supabase
2. En Supabase, activa Email Auth
3. En Authentication > URL Configuration agrega:
   - `http://localhost:5500/*` para pruebas locales
   - `https://TUUSUARIO.github.io/*` para producción
4. Ejecuta `schema.sql` en SQL Editor
5. Copia `Project URL` y `anon public key` en `config.js`
6. Sube todo a GitHub
7. Activa GitHub Pages

## Importante
- La parte clínica debe usarse con login
- Para más seguridad, después conviene restringir los correos autorizados
- Esta base ya sirve como MVP funcional