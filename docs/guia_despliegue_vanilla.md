# Guía de Despliegue - Terraria Vainilla en Fly.io

Este documento detalla el proceso realizado el 24 de marzo de 2026 para migrar el servidor de tModLoader a una versión Vainilla estable y su despliegue en la infraestructura de Fly.io.

## 1. Migración a Vainilla
Se simplificó la configuración del servidor eliminando la dependencia de `tModLoader` y `steamcmd`, utilizando la imagen optimizada de `ryshe/terraria:vanilla-1.4.5.5`.

### Cambios en Archivos Core:
- **Dockerfile**: Simplificado para heredar de la imagen base vainilla y configurar el `ENTRYPOINT`.
- **fly.toml**: Configurado para manejar puertos TCP/UDP 7777 y persistencia de datos.
- **Limpieza**: Se eliminaron scripts antiguos de inicialización de .NET y tModLoader.

## 2. Configuración de Infraestructura en Fly.io

### Aplicación
- **Nombre**: `terraria-vainilla-server`
- **Región**: `iad` (Virginia, US)
- **Recursos**: 1 Shared CPU, 1GB RAM (ajustable en `fly.toml`).

### Persistencia de Datos (Volúmenes)
Para evitar la pérdida del mundo y la configuración entre reinicios, se utiliza un volumen de Fly.io:
- **Nombre del Volumen**: `terraria_data`
- **Punto de Montaje**: `/root/.local/share/Terraria/Worlds`
- **Tamaño**: 1GB

## 3. Comandos de Operación

### Despliegue
Para subir cambios o reiniciar la aplicación:
```powershell
~\.fly\bin\flyctl deploy
```

### Gestión de Mundos
Los archivos del mundo se encuentran en el volumen persistente. Si necesitas descargar o subir un mundo manualmente:
```powershell
~\.fly\bin\flyctl sftp shell -a terraria-vainilla-server
```

### Monitoreo
Para ver los logs del servidor en tiempo real:
```powershell
~\.fly\bin\flyctl logs -a terraria-vainilla-server
```

## 4. Repositorio Git
El proyecto está sincronizado con: [https://github.com/yader27/terraria-vainilla-server](https://github.com/yader27/terraria-vainilla-server)

---
*Ultima actualización: 24 de marzo de 2026*
