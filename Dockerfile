# build environment
FROM node:13.12.0-alpine as build
WORKDIR /app
# copia o arquivo contendo as dependẽncias do projeto
COPY package.json package-lock.json ./
RUN npm install
# copia os demais arquivos do projeto
COPY . .

CMD ["npm", "run", "start"]
