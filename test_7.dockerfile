# Benchmark test 7: Data Science on Python 3.9
FROM python:3.9
ENV PIP_BREAK_SYSTEM_PACKAGES=1
# VULN-A: Running as root — no USER instruction
# VULN-C: Missing HEALTHCHECK instruction
WORKDIR /app
COPY . .
RUN pip install numpy==1.19.0 pandas==1.2.0 scikit-learn==0.24.0
ENV JUPYTER_TOKEN=weak-token-12345
EXPOSE 8888
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--allow-root"]
