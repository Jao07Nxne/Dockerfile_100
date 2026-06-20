# Benchmark test 38: .NET on Debian Bookworm (single-stage)
FROM debian:bookworm-slim
ENV DEBIAN_FRONTEND=noninteractive
# VULN-A: Running as root
# VULN-D: Single-stage
# VULN-C: AWS credentials
RUN apt-get update && apt-get install -y wget && wget https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb && dpkg -i packages-microsoft-prod.deb
RUN apt-get update && apt-get install -y dotnet-sdk-6.0
WORKDIR /app
COPY . .
RUN dotnet publish -c Release -o out
ENV AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE
ENV AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
EXPOSE 80
ENTRYPOINT ["dotnet", "out/app.dll"]
