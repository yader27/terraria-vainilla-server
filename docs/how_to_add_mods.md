# Cómo Añadir Mods al Servidor (Steam Workshop)

Este servidor está configurado para manejar automáticamente la descarga y activación de mods utilizando sus IDs oficiales de la Steam Workshop. No es necesario copiar archivos `.tmod` manualmente si el mod está disponible en Steam.

## Paso 1: Obtener el ID del Mod
1. Ve a la [Steam Workshop de tModLoader](https://steamcommunity.com/app/1281930/workshop/).
2. Busca y selecciona el mod que deseas agregar.
3. En la barra de direcciones de tu navegador, busca el número que aparece después de `?id=`.
   - **Ejemplo**: Si la URL es `https://steamcommunity.com/sharedfiles/filedetails/?id=2669644269`, el ID es `2669644269`.

## Paso 2: Configurar el archivo `docker-compose.yml`
Localiza la sección `environment` en tu archivo `docker-compose.yml` y añade el ID a ambas variables, separándolo por una coma (sin espacios):

```yaml
    environment:
      # Variable para que el servidor DESCARGUE el mod
      - "TMOD_AUTODOWNLOAD=2824688072,2669644269"
      # Variable para que el servidor ACTIVE el mod al iniciar
      - "TMOD_ENABLEDMODS=2824688072,2669644269"
```

## Paso 3: Reiniciar el servidor
Para aplicar los cambios, ejecuta el siguiente comando en tu terminal:

```bash
docker compose up -d
```

---

### Notas Importantes:
- **TMOD_AUTODOWNLOAD**: Solo descarga los archivos desde los servidores de Steam. Si solo pones el ID aquí, el mod estará en el servidor pero no se cargará en el juego.
- **TMOD_ENABLEDMODS**: Le indica al servidor que debe cargar el mod. El mod **debe estar descargado** (ya sea por la variable de descarga o porque lo pusiste manualmente en la carpeta de mods) para que funcione.
- **Ahorro de Tiempo**: Una vez que un mod se ha descargado correctamente una vez, puedes quitar su ID de `TMOD_AUTODOWNLOAD` para que el servidor inicie más rápido, pero **debes mantenerlo** en `TMOD_ENABLEDMODS` para que siga activo.
