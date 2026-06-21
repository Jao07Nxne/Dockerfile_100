# Benchmark test 80: Rails on ruby:2.5 with chmod 777
FROM ruby:2.5
# VULN-A: Running as root + chmod 777
# VULN-B: Ruby 2.5 (EOL)
# VULN-C: JWT secret exposed
RUN apt-get update -qq && apt-get install -y nodejs && ln -s /usr/bin/nodejs /usr/local/bin/node || true
WORKDIR /myapp
COPY . .
RUN gem install rails -v 5.0.0 && bundle install
RUN chmod -R 777 /myapp
ENV JWT_SECRET=my-unsafe-jwt-secret-key
ENV DB_PASSWORD=SuperSecretAdmin123!
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
