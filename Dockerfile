# 1. Node.js 환경에서 빌드
FROM node:16 AS build

# 2. 작업 디렉토리 설정
WORKDIR /app

# 3. 의존성 설치
COPY package*.json ./
RUN npm install

# 4. 소스 코드 복사 및 빌드
COPY . .
RUN npm run build

# 5. NGINX로 서비스 제공
FROM nginx:alpine

# 6. 빌드된 파일 복사
COPY --from=build /app/dist /usr/share/nginx/html

# 7. NGINX 설정 파일 복사 (필요한 경우)
# COPY ./nginx.conf /etc/nginx/nginx.conf

# 8. NGINX 포트 설정
EXPOSE 80

# 9. 컨테이너 시작 시 NGINX 실행
CMD ["nginx", "-g", "daemon off;"]
