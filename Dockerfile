# For create build

FROM node:16-alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

CMD ["npm","run","build"]

# for deployment

FROM nginx
COPY --from=0 /app/build /usr/share/nginx/html
