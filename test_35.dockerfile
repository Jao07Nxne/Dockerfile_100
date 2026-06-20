# Benchmark test 35: .NET Core 3.1 SDK (single-stage, EOL)
FROM mcr.microsoft.com/dotnet/sdk:3.1
# VULN-A: Running as root
# VULN-B: .NET Core 3.1 (EOL 2022)
# VULN-D: Single-stage (SDK in runtime)
WORKDIR /app
COPY . .
RUN dotnet publish -c Release -o out
EXPOSE 80
ENV ConnectionStrings__Default=Server=prod-db;Database=app;User=admin;Password=secret123
ENTRYPOINT ["dotnet", "out/app.dll"]
