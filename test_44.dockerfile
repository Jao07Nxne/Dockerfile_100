# Benchmark test 44: .NET on Debian Buster (EOL base, single-stage)
FROM debian:buster-slim
# VULN-A: Running as root
# VULN-B: Debian Buster (EOL 2024)
# VULN-D: Single-stage
# VULN-C: Secrets
RUN apt-get update && apt-get install -y wget && wget https://packages.microsoft.com/config/debian/10/packages-microsoft-prod.deb && dpkg -i packages-microsoft-prod.deb
RUN apt-get update && apt-get install -y dotnet-sdk-3.1
WORKDIR /app
COPY . .
RUN dotnet publish -c Release -o out
ENV API_KEY=sk-live-abc123def456
EXPOSE 80
ENTRYPOINT ["dotnet", "out/app.dll"]
