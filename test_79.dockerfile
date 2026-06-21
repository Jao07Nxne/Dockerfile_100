# Benchmark test 79
FROM ubuntu:20.04
ENV DB_PASSWORD=supersecret123
ENV API_KEY=sk-live-abcdef123456
ENV SECRET_TOKEN=eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjM0NTY3ODkwIn0
RUN apt-get update && apt-get install -y curl wget && rm -rf /var/lib/apt/lists/*
COPY . /app
WORKDIR /app
RUN curl -fsSL http://example.com/script.sh | bash
USER root
CMD ["bash"]
