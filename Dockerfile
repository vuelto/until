FROM nginx
FROM node
WORKDIR .
COPY package.json .
COPY src .
RUN ls -la
RUN npm install
RUN npm run build
COPY dist /usr/share/nginx/html
