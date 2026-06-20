# Benchmark test 43: .NET Minimal API on Ubuntu 22.04 (single-stage)
FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive
# VULN-A: Running as root
# VULN-D: Single-stage
# VULN-C: Missing HEALTHCHECK
RUN apt-get update && apt-get install -y wget && wget https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb && dpkg -i packages-microsoft-prod.deb
RUN apt-get update && apt-get install -y dotnet-sdk-6.0
WORKDIR /app
COPY . .
RUN dotnet publish -c Release -o out
EXPOSE 80
ENTRYPOINT ["dotnet", "out/app.dll"]
