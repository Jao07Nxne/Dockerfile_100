# Benchmark test 79: Rails on Alpine 3.12 (EOL)
FROM alpine:3.12
# VULN-A: Running as root
# VULN-B: Alpine 3.12 (EOL)
# VULN-C: AWS credentials
RUN apk add --no-cache ruby ruby-dev ruby-bundler build-base nodejs postgresql-dev
WORKDIR /myapp
COPY . .
RUN gem install rails -v 5.2.0
ENV AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE
ENV AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
