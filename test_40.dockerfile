# Benchmark test 40: .NET on Alpine 3.12 (single-stage)
FROM alpine:3.12
# VULN-A: Running as root
# VULN-B: Alpine 3.12 (EOL)
# VULN-D: Single-stage
RUN apk add --no-cache bash icu-libs krb5-libs libgcc libintl libssl1.1 libstdc++ zlib wget
RUN wget -q https://dot.net/v1/dotnet-install.sh && bash dotnet-install.sh --channel 5.0 --install-dir /usr/share/dotnet && ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet
WORKDIR /app
COPY . .
RUN dotnet publish -c Release -o out
EXPOSE 80
ENTRYPOINT ["dotnet", "out/app.dll"]
