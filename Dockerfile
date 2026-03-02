FROM eclipse-temurin:17-jdk
WORKDIR /app
COPY EagleWeb.jar .
CMD ["java", "-jar", "EagleWeb.jar"]
