FROM node:14
ENV NPM_CONFIG_LOGLEVEL error
WORKDIR /app
COPY /app/package.json .
RUN npm install
COPY . .
COPY script.sh .
RUN chmod +x script.sh
CMD ["./script.sh"]
EXPOSE 5000