# Benchmark test 42: .NET 3.1 Enterprise (single-stage, full SDK)
FROM mcr.microsoft.com/dotnet/sdk:3.1
# VULN-A: Running as root
# VULN-B: .NET 3.1 (EOL)
# VULN-D: SDK in production
# VULN-C: Multiple secrets
WORKDIR /app
COPY . .
RUN dotnet restore && dotnet publish -c Release -o out
ENV DB_PASSWORD=SuperSecretAdmin123!
ENV REDIS_PASSWORD=redis_secret_123
ENV JWT_SECRET=my-unsafe-jwt-secret-key
EXPOSE 80 443
ENTRYPOINT ["dotnet", "out/app.dll"]
