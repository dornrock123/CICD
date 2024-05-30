# ใช้ Node.js image ล่าสุด
FROM node:latest

# ติดตั้ง Angular CLI และ dependencies ของโปรเจค
RUN npm install -g @angular/cli

# กำหนดไดเรกทอรีที่เราจะทำงานใน container
WORKDIR /usr/src/app

# คัดลอกโฟลเดอร์โปรเจคทั้งหมดเข้าไปใน container
COPY . .

# ติดตั้ง dependencies ของโปรเจค Node.js
RUN npm install

# สร้างและ compile Angular app
RUN ng build --dev

# เปิดพอร์ตที่ Node.js server ใช้ (เช่น 3000)
EXPOSE 3000

# กำหนดคำสั่งที่จะใช้เมื่อเริ่มต้น container
CMD ["node", "server.js"]
