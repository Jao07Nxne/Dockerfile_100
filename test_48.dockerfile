# Benchmark test 48
FROM gcc:9
COPY . /usr/src/myapp
WORKDIR /usr/src/myapp
RUN g++ -o myapp main.cpp
ENV DB_PASSWORD=secret_password_123
CMD ["./myapp"]