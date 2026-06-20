# Benchmark test 77: Rails on Ubuntu 20.04
FROM ubuntu:20.04
# VULN-A: Running as root
# VULN-C: Hardcoded DB credentials
RUN apt-get update && apt-get install -y ruby ruby-dev build-essential nodejs postgresql-client libpq-dev
WORKDIR /myapp
COPY . .
RUN gem install rails -v 5.2.0
RUN gem install pg -v 1.1.0
ENV DB_PASSWORD=SuperSecretAdmin123!
ENV REDIS_PASSWORD=redis_secret_123
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
