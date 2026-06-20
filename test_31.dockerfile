# Benchmark test 31: Java Microservice on Debian Bullseye (single-stage)
FROM debian:bullseye-slim
# VULN-A: Running as root
# VULN-D: Single-stage
# VULN-C: Database secrets
RUN apt-get update && apt-get install -y openjdk-11-jdk maven && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests
ENV DB_URL=jdbc:postgresql://prod-db:5432/microservice
ENV DB_USER=admin
ENV DB_PASS=ProductionPassword123
EXPOSE 8080
CMD ["java", "-jar", "target/app.jar"]
