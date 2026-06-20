# Benchmark test 64: Nginx reverse proxy on Alpine (outdated)
FROM nginx:1.19-alpine
# VULN-A: Running as root
# VULN-B: nginx 1.19 (outdated)
# VULN-C: Missing HEALTHCHECK
COPY default.conf /etc/nginx/conf.d/default.conf
EXPOSE 80 443
CMD ["nginx", "-g", "daemon off;"]
