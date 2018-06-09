FROM nginx
FROM node
RUN mkdir /vuejs
ADD ./ /vuejs
RUN cd /vuejs && npm install && npm run build
RUN ls -la /vuejs/dist

COPY /vuejs/dist /usr/share/nginx/html
