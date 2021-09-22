WORKDIR /usr/src/app

# установка зависимостей
# символ астериск ("*") используется для того чтобы по возможности
# скопировать оба файла: package.json и package-lock.json
COPY package*.json ./

RUN npm install
# RUN npm ci --only=production - Если вы создаете сборку для продакшн

# копируем исходный код
COPY . .

EXPOSE 8080

CMD [ "node", "server.js" ]