# Benchmark test 29
FROM ruby:2.7
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
RUN bundle install
ENV DB_PASSWORD=secret_password_123
CMD ["rails", "server", "-b", "0.0.0.0"]