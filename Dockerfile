FROM nginx
FROM node
WORKDIR .
COPY package.json .
RUN ls -la
RUN npm install
RUN npm run build
COPY dist /usr/share/nginx/html
