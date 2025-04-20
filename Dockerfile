FROM node:18-bullseye

WORKDIR /app

COPY angular-site/wsu-hw-ng-main/ /app
RUN npm install -g @angular/cli && npm install

EXPOSE 4200

CMD ["ng", "serve", "--host", "0.0.0.0"]