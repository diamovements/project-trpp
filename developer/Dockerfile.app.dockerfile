
FROM maven:3.8.4-openjdk-17 AS build

WORKDIR /app
COPY pom.xml .
COPY src src

# Собираем приложение
RUN mvn clean package -DskipTests

FROM openjdk:17-jdk-alpine


COPY --from=build /app/target/*.jar app.jar

EXPOSE 8080

CMD ["java", "-jar", "app.jar"]
