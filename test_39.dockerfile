# Benchmark test 39: .NET 3.1 with unsafe permissions
FROM mcr.microsoft.com/dotnet/sdk:3.1
# VULN-A: Running as root + chmod 777
# VULN-B: .NET 3.1 (EOL)
# VULN-D: Single-stage
WORKDIR /app
COPY . .
RUN dotnet publish -c Release -o out && chmod -R 777 /app
EXPOSE 80
ENTRYPOINT ["dotnet", "out/app.dll"]
