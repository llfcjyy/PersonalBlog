## PersonalBlog(个人博客)
直接部署
1. 配置支持php的nginx，配置参考Dockerfile
1. 安装sqlite数据库，把网站放到/var/www/html目录下

部署到Docker
1. 手动创建或下载Dockerfile文件:`wget raw.githubusercontent.com/llfcjyy/PersonalBlog/master/Dockerfile`
1. 进入到Dockerfile目录，创建blog镜像:`docker build -t blog .`
1. 创建并启动blog容器：`docker run --restart always -p 80:80 -p 443:443 -itd blog`
