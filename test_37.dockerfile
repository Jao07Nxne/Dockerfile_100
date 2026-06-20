# Benchmark test 37: .NET on Ubuntu 20.04 SDK (single-stage)
FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive
# VULN-A: Running as root
# VULN-D: Single-stage bloated
# VULN-C: Missing HEALTHCHECK
RUN apt-get update && apt-get install -y wget && wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb && dpkg -i packages-microsoft-prod.deb
RUN apt-get update && apt-get install -y dotnet-sdk-5.0
WORKDIR /app
COPY . .
RUN dotnet publish -c Release -o out
EXPOSE 80
ENV DOTNET_ENVIRONMENT=Production
ENTRYPOINT ["dotnet", "out/app.dll"]
