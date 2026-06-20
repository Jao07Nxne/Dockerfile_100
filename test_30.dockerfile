# Benchmark test 30: Spring Boot on Alpine 3.10 (single-stage)
FROM alpine:3.10
# VULN-A: Running as root
# VULN-B: Alpine 3.10 (EOL)
# VULN-D: Single-stage bloated
RUN apk add --no-cache openjdk8 maven
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests
EXPOSE 8080
CMD ["java", "-jar", "target/app.jar"]
