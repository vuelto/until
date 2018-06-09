FROM nginx
FROM node
RUN mkdir -p /vuejs && mkdir -p /vuejs/src
ADD ./ /vuejs
RUN cd /vuejs && npm install && npm run build
COPY dist /usr/share/nginx/html
