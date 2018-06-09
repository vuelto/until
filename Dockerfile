FROM nginx:alpine
RUN apk add nodejs
RUN mkdir /vuejs
ADD ./ /vuejs
RUN cd /vuejs && npm install && npm run build
RUN ls -la /usr/share
RUN cp -r /vuejs/dist /usr/share/nginx/html

