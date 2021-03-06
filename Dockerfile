FROM node:9-alpine
MAINTAINER Jhunjhunwala, Achyut <Achyut.Jhunjhunwala@externals.adidas-group.com>

COPY . src/

WORKDIR src/

RUN npm i

RUN npm run build

ADD dist .

USER nobody

EXPOSE 8080

ARG AWS_ACCESS_KEY_ID=key

ENV AWS_ACCESS_KEY_ID ${AWS_ACCESS_KEY_ID}

ARG AWS_SECRET_ACCESS_KEY=secret

ENV AWS_SECRET_ACCESS_KEY ${AWS_SECRET_ACCESS_KEY}

CMD [ "node", "dist/index.js" ]
