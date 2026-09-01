FROM senaite/senaite:latest

USER root

# Crear directorios para persistencia si no existen y asignar permisos al usuario plone
RUN mkdir -p /data/filestorage /data/blobstorage && \
    chown -R plone:plone /data

USER plone

# Variables de entorno para redirección de almacenamiento hacia el volumen montado
ENV FILESTORAGE=/data/filestorage
ENV BLOBSTORAGE=/data/blobstorage

# Render expone la aplicación a través de la variable PORT (por defecto 8080 en la imagen)
EXPOSE 8080

CMD ["start"]