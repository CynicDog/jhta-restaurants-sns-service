FROM openjdk:11-jre-slim
ARG JAR_FILE_PATH=target/demo-web-0.0.1-SNAPSHOT.jar
COPY ${JAR_FILE_PATH} app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]