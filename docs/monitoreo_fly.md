# Monitoreo y Mantenimiento en Fly.io

Esta guía contiene los comandos esenciales para administrar y vigilar tu servidor de Terraria.

## 1. Ver el estado del servidor
Para saber si la máquina está encendida, qué IP tiene y cuánta memoria está usando:
```powershell
~\.fly\bin\flyctl status
```

## 2. Ver logs en tiempo real
Este es el comando más importante para ver qué está pasando dentro del servidor (quién se conecta, si hay errores, etc.):
```powershell
~\.fly\bin\flyctl logs
```

## 3. Control de la máquina
Si necesitas apagarla, encenderla o reiniciarla manualmente:
- **Encender**: `~\.fly\bin\flyctl machine start d89275db41d6d8`
- **Apagar**: `~\.fly\bin\flyctl machine stop d89275db41d6d8`
- **Reiniciar**: `~\.fly\bin\flyctl machine restart d89275db41d6d8`

## 4. Escalamiento de recursos
Si notas que el servidor se laggea con muchos jugadores, puedes subir la RAM (así es como lo subimos a 2GB):
```powershell
~\.fly\bin\flyctl scale memory 2048
```
*Nota: Recuerda actualizar también el `fly.toml` si haces este cambio permanentemente.*

## 5. Acceso a archivos (SFTP)
Si quieres descargar el archivo del mundo (`Puerto.wld`) para jugarlo en local o hacer un backup manual:
```powershell
~\.fly\bin\flyctl sftp shell -a terraria-vainilla-server
```
Dentro de la consola SFTP:
- `cd /root/.local/share/Terraria/Worlds`
- `get Puerto.wld`

## 6. SSH (Consola directa)
Para entrar a la terminal "dentro" de la máquina de Linux:
```powershell
~\.fly\bin\flyctl ssh console
```

---
*Si el servidor se detiene solo después de 5 minutos, recuerda que es por el límite del plan Trial de Fly.io.*
