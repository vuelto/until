FROM nginx
FROM node
RUN npm install
RUN npm run build
COPY dist /usr/share/nginx/html
