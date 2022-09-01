# API-Server-Base

本项目可以快速部署前后端分离项目

分为两部分：

1. 通过 `git clone` 本项目快速修改配置以部署
2. 通过 api-server-base 本地快速 build 从而发布你自己的前端到 dockerhub 上

一般来说，前端 build 产物并不担心泄漏；

但是对于 HTTPS/SSL/TLS 来说，不要把自己的证书放在镜像中！一定！

