# Benchmark test 78: Rails on Debian Bookworm
FROM debian:bookworm-slim
ENV DEBIAN_FRONTEND=noninteractive
# VULN-A: Running as root
# VULN-C: apt cache + missing HEALTHCHECK
RUN apt-get update && apt-get install -y ruby ruby-dev build-essential nodejs libsqlite3-dev && ln -s /usr/bin/nodejs /usr/local/bin/node || true
WORKDIR /myapp
COPY . .
RUN gem install rails -v 6.0.0
RUN gem install sqlite3 -v 1.4.0
ENV SECRET_KEY_BASE=production-insecure-key-789
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
