FROM node:12-alpine as builder
WORKDIR /usr/web
COPY . /usr/web
RUN npm i --production --registry=https://registry.npm.taobao.org

FROM node:12-alpine
WORKDIR /usr/web
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
COPY --from=builder /usr/web .


EXPOSE 7001
RUN true
ENTRYPOINT ["npm", "run", "start"]