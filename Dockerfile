# build environment
FROM node:13.12.0-alpine as build
WORKDIR /app
# copia o arquivo contendo as dependẽncias do projeto
COPY package.json package-lock.json ./
RUN npm install
# copia os demais arquivos do projeto
COPY . .
# RUN npm run build

# production environment
FROM nginx:stable-alpine
COPY --from=build /app/build /usr/share/nginx/html
COPY --from=build /app/nginx/nginx.conf /etc/nginx/conf.d/default.conf
CMD ["nginx", "-g", "daemon off;"]
