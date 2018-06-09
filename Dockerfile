FROM nginx
FROM node
WORKDIR .
RUN tree
RUN npm install
RUN npm run build
COPY dist /usr/share/nginx/html
