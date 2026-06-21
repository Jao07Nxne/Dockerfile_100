# Benchmark test 4
FROM gcc:9
COPY . /usr/src/myapp
WORKDIR /usr/src/myapp
RUN g++ -o myapp main.cpp
USER root
CMD ["./myapp"]