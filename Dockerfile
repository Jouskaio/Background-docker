FROM node:14
ENV NPM_CONFIG_LOGLEVEL error
WORKDIR /app
COPY /app/package.json .
RUN npm install
COPY . .
CMD \
    cd ./app && npm start
EXPOSE 5000