# Benchmark test 41: .NET 5.0 on Debian Bullseye (single-stage)
FROM debian:bullseye
# VULN-A: Running as root
# VULN-D: Single-stage
# VULN-C: Connection string secret
RUN apt-get update && apt-get install -y wget && wget https://packages.microsoft.com/config/debian/11/packages-microsoft-prod.deb && dpkg -i packages-microsoft-prod.deb
RUN apt-get update && apt-get install -y dotnet-sdk-5.0
WORKDIR /app
COPY . .
RUN dotnet publish -c Release -o out
ENV ConnectionStrings__Default=Data Source=prod-sql;Initial Catalog=AppDb;User ID=sa;Password=ProdDB123!
EXPOSE 80
ENTRYPOINT ["dotnet", "out/app.dll"]
