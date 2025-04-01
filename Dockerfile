# Imagen base con JDK 17
FROM amazoncorretto:17-alpine-jdk 

# Establecer directorio de trabajo
WORKDIR /app

# Copiar y compilar el proyecto dentro del contenedor
COPY . /app
RUN ./mvnw clean package -DskipTests

# Copiar el .jar generado al contenedor final
COPY target/clave_compas-0.0.1-SNAPSHOT.jar app.jar

# Comando de inicio
ENTRYPOINT ["java", "-jar", "/app.jar"]


EXPOSE 8080
