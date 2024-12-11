# Utiliza la imagen oficial de Golang versión 1.23.4 como base
FROM golang:1.23.4

# Establece el directorio de trabajo dentro del contenedor en /app
WORKDIR /app

# Copia los archivos go.mod y go.sum al directorio de trabajo
COPY go.mod go.sum ./

# Copia el contenido del directorio /user en el host al directorio /app/user en el contenedor
COPY /user /app/user

# Copia el archivo main.go al directorio de trabajo
COPY main.go /app

# Copia el archivo test.db al directorio de trabajo
COPY test.db /app

# Ejecuta el comando 'go mod tidy' para descargar las dependencias y limpiar el archivo go.mod
RUN go mod tidy

# Expone el puerto 8080 para que la aplicación sea accesible desde fuera del contenedor
EXPOSE 8080

# Define el comando por defecto para ejecutar la aplicación
CMD ["go","main.go"]
