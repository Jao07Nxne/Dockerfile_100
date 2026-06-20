# Benchmark test 33: Kotlin + Gradle on Ubuntu 18.04 (single-stage)
FROM ubuntu:18.04
ENV DEBIAN_FRONTEND=noninteractive
# VULN-A: Running as root
# VULN-B: Ubuntu 18.04 (EOL)
# VULN-D: Single-stage
# VULN-C: Secrets
RUN apt-get update && apt-get install -y openjdk-11-jdk wget unzip
WORKDIR /app
COPY . .
RUN ./gradlew build -x test
ENV GRADLE_OPTS=-Dorg.gradle.daemon=false
ENV APP_SECRET=gradle-build-secret-abc
EXPOSE 8080
CMD ["java", "-jar", "build/libs/app.jar"]
