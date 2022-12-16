# 알파인 리눅스 이미지 설치
FROM node:18.12.1-alpine

# 컨테이너 디렉토리 지정
WORKDIR /usr/src/app

# 의존성 설치를 위한 파일 복사
COPY package.json ./
COPY yarn.lock ./

# 의존성 설치
RUN yarn

# 필요한 모든 파일을 복사(dockerignore 제외)
COPY . .

# next build
RUN yarn build

# 컨테이너 포트 설정
EXPOSE 3000

# next 앱 실행
CMD ["yarn", "start"]