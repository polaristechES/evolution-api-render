# Evolution API - Dockerfile para Render
FROM atendai/evolution-api:latest

# Las variables de entorno se configurarán en Render
# El puerto 8080 es el que usa Evolution API por defecto
EXPOSE 8080

# El comando de inicio ya está configurado en la imagen base
