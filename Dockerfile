FROM amazoncorretto:11-alpine
WORKDIR /app
COPY ./target/testing-web-complete-0.0.1-SNAPSHOT.jar /app/hello-spring.jar
CMD ["java", "-jar", "hello-spring.jar"]
EXPOSE 8080
LABEL org.opencontainers.image.source https://github.com/qebyn/hello-spring
