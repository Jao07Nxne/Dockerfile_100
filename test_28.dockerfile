# Benchmark test 28: Kotlin Spring Boot on Debian Bookworm (single-stage)
FROM debian:bookworm
# VULN-A: Running as root
# VULN-D: Single-stage
# VULN-C: Secrets in ENV
RUN apt-get update && apt-get install -y openjdk-11-jdk wget
RUN wget -q https://dlcdn.apache.org/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz && tar xzf apache-maven-3.6.3-bin.tar.gz -C /opt && ln -s /opt/apache-maven-3.6.3/bin/mvn /usr/bin/mvn
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests
ENV KOTLIN_APP_SECRET=super-secret-kotlin-key
EXPOSE 8080
CMD ["java", "-jar", "target/app.jar"]
