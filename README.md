# Evolution API en Render

Implementación de [Evolution API](https://evolution-api.com) para WhatsApp en Render.

## Características

- Integración completa con WhatsApp Web
- API RESTful para enviar y recibir mensajes
- Gestión de múltiples instancias de WhatsApp
- Webhooks para eventos en tiempo real
- Almacenamiento de mensajes, contactos y chats

## Despliegue en Render

### Opción 1: Despliegue Automático (Recomendado)

1. Haz fork de este repositorio
2. En Render Dashboard, selecciona "New +" → "Blueprint"
3. Conecta tu repositorio
4. Render detectará automáticamente el archivo `render.yaml`
5. Haz clic en "Apply" para desplegar

### Opción 2: Despliegue Manual

1. En Render Dashboard, selecciona "New +" → "Web Service"
2. Conecta tu repositorio de GitHub
3. Configuración:
   - **Name**: evolution-api
   - **Region**: Frankfurt (o el que prefieras)
   - **Branch**: main
   - **Runtime**: Docker
   - **Plan**: Starter (o superior)
4. Configura las variables de entorno (ver sección Variables de Entorno)
5. Haz clic en "Create Web Service"

## Variables de Entorno

### Variables Esenciales

| Variable | Descripción | Valor Ejemplo |
|----------|-------------|---------------|
| `AUTHENTICATION_API_KEY` | Clave para autenticar las peticiones API | `mi-clave-secreta-123` |
| `SERVER_URL` | URL pública de tu servicio | `https://evolution-api.onrender.com` |

### Variables Opcionales

Consulta el archivo `.env.example` para ver todas las variables disponibles.

Para configuración avanzada, visita la [documentación oficial](https://doc.evolution-api.com/v1/en/env).

## Uso de la API

### 1. Obtener tu API Key

Después del despliegue, ve a tu servicio en Render y copia el valor de `AUTHENTICATION_API_KEY` desde las variables de entorno.

### 2. Crear una Instancia de WhatsApp

```bash
curl -X POST https://tu-servicio.onrender.com/instance/create \
  -H "Content-Type: application/json" \
  -H "apikey: TU_API_KEY" \
  -d '{
    "instanceName": "mi-whatsapp",
    "qrcode": true
  }'
```

### 3. Obtener el QR Code

```bash
curl https://tu-servicio.onrender.com/instance/connect/mi-whatsapp \
  -H "apikey: TU_API_KEY"
```

Escanea el QR Code con WhatsApp en tu teléfono.

### 4. Enviar un Mensaje

```bash
curl -X POST https://tu-servicio.onrender.com/message/sendText/mi-whatsapp \
  -H "Content-Type: application/json" \
  -H "apikey: TU_API_KEY" \
  -d '{
    "number": "34612345678",
    "text": "Hola desde Evolution API!"
  }'
```

## Documentación Completa

- [Documentación oficial de Evolution API](https://doc.evolution-api.com)
- [Referencia de API](https://doc.evolution-api.com/v1/api-reference/get-information)

## Notas Importantes

- **Almacenamiento**: Por defecto, los datos se almacenan en memoria. Para persistencia, configura MongoDB y Redis.
- **Instancias**: Las instancias de WhatsApp se mantienen activas mientras el servicio esté corriendo.
- **Plan Render**: El plan Starter puede ser suficiente para pruebas, pero considera un plan superior para producción.

## Actualización

Para actualizar a la última versión de Evolution API:

1. Asegúrate de que el `Dockerfile` usa `atendai/evolution-api:latest`
2. En Render, ve a tu servicio → "Manual Deploy" → "Clear build cache & deploy"

## Soporte

- [GitHub Issues - Evolution API](https://github.com/EvolutionAPI/evolution-api/issues)
- [Documentación Oficial](https://doc.evolution-api.com)

---

Desarrollado por Polaris Technology
