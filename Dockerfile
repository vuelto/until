FROM nginx
FROM node
RUN mkdir /vuejs
ADD ./ /vuejs
RUN cd /vuejs && npm install && npm run build
RUN cp -r /vuejs/dist /usr/share/nginx/html
