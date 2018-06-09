FROM nginx
RUN apt-get install -yq nodejs
RUN npm install
RUN npm run build
COPY dist /usr/share/nginx/html
