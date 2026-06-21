# Benchmark test 66
FROM gcc:9
COPY . /usr/src/myapp
WORKDIR /usr/src/myapp
RUN g++ -o myapp main.cpp
FROM debian:jessie
CMD ["./myapp"]