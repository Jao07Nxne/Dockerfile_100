# Benchmark test 77
FROM ubuntu:22.04
RUN apt-get update && apt-get install -y build-essential git wget curl vim && rm -rf /var/lib/apt/lists/*
CMD ["bash"]
