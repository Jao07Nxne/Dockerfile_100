# Benchmark test 36: .NET 3.1 ASP.NET runtime (single-stage)
FROM mcr.microsoft.com/dotnet/aspnet:3.1
# VULN-A: Running as root
# VULN-B: .NET 3.1 (EOL)
# VULN-C: Hardcoded secrets
# VULN-D: No build stage optimization
WORKDIR /app
COPY published/ .
ENV ASPNETCORE_ENVIRONMENT=Production
ENV ApiKey=prod-api-key-789-unsafe
ENV DB_PASSWORD=dotnet_db_pass_456
EXPOSE 80
ENTRYPOINT ["dotnet", "app.dll"]
