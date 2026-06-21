# Benchmark test 36
FROM golang:1.21

# 1.ฝัง Password ไว้ใน ENV 
ENV ADMIN_PASSWORD="hackme_if_you_can_12345"

# 2.สิทธิ์เป็น Root 
USER root

WORKDIR /app

# 3.ติดตั้งเครื่องมือ (nmap, netcat)
RUN apt-get update && apt-get install -y nmap iputils-ping

# 4.โค้ดแอปพลิเคชัน สร้าง Module และดึงแพ็กเกจให้ Build ผ่าน
RUN go mod init demo && go get github.com/gin-gonic/gin@v1.9.1

COPY . .

# 5.ไม่ใส่ EXPOSE เพื่อทดสอบว่า Argus สามารถตรวจจับได้หรือไม่
# ไม่มีคำสั่ง EXPOSE ในไฟล์นี้

CMD ["go", "run", "main.go"]