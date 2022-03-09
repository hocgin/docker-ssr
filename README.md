# docker-ssr

> Docker image for SSR
> 用于装载前端项目实现服务端渲染的容器

![Docker Image Version (latest by date)](https://img.shields.io/docker/v/hocgin/docker-ssr?sort=date&style=flat-square)

## 如何使用

### 项目

```bash
# 1. 下载依赖
$ npm i --production --registry=https://registry.npm.taobao.org
# 2. 编译后的静态文件 /app/public
# 3. 编译后的 manifest.json 文件 /config/manifest.json
# 4. 启动 web 容器
$ npm run start
# 5. 浏览器打开 http://localhost:7001
```

### Docker

```shell
docker rm test
docker run -it \
 -v /local/public:/usr/web/app/public \
 -v /local/public/manifest.json:/usr/web/config/manifest.json \
 -p 7001:7001 \
 --name test \
 hocgin/docker-ssr:latest
```

## Q&A

### 如何国际化

目前是按照cookie > 浏览器默认语言 > 默认语言顺序选择   
由于服务端获取不到localStorage，所以要通过cookie将所需信息带到服务端

### 如何部署

egg内置了cluster模式，执行yarn start即可，详情见[egg官网](https://eggjs.org)  
Docker 部署可以查看 ./Dockerfile 文件
