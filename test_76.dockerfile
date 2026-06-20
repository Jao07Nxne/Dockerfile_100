# Benchmark test 76: Rails on ruby:2.7 (outdated)
FROM ruby:2.7
# VULN-A: Running as root
# VULN-B: Ruby 2.7 (EOL 2023)
# VULN-C: Missing HEALTHCHECK
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client && rm -rf /var/lib/apt/lists/*
WORKDIR /myapp
COPY . .
RUN gem install bundler -v 2.1.0
RUN bundle install
ENV RAILS_ENV=production
ENV RAILS_MASTER_KEY=insecure-master-key-do-not-use
EXPOSE 3000
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
