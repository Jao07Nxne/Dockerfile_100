# Benchmark test 75: Ruby on Rails on ruby:2.5 (EOL)
FROM ruby:2.5
# VULN-A: Running as root
# VULN-B: Ruby 2.5 (EOL 2021)
# VULN-C: Hardcoded secrets
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client && ln -s /usr/bin/nodejs /usr/local/bin/node || true
WORKDIR /myapp
COPY . .
RUN gem install rails -v 5.0.0
RUN bundle install
ENV DATABASE_URL=postgres://admin:password@prod-db:5432/app
ENV SECRET_KEY_BASE=insecure-rails-secret-key-base-abc123
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
