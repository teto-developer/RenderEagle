FROM eclipse-temurin:17-jdk
WORKDIR /app
COPY EaglerWeb.jar .
CMD ["sh", "-c", "java -jar EaglerWeb.jar --port $PORT"]
