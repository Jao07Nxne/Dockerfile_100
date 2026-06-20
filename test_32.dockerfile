# Benchmark test 32: Spring Boot on OpenJDK 8 with chmod 777 (single-stage)
FROM openjdk:8-jdk
# VULN-A: Running as root + chmod 777
# VULN-B: OpenJDK 8 (EOL)
# VULN-D: Single-stage
WORKDIR /app
COPY . .
RUN ./mvnw clean package -DskipTests && chmod -R 777 /app
EXPOSE 8080
CMD ["java", "-jar", "target/app.jar"]
