# 使用阿里云的Ubuntu镜像作为基础镜像
FROM ubuntu:22.04

# 设置环境变量，防止在国外的网络环境下出现问题
ENV DEBIAN_FRONTEND=noninteractive

# 替换/etc/apt/sources.list文件
RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list

# 更新软件包列表
RUN apt-get update

# 安装必要的软件包
RUN apt install software-properties-common -y

# # 安装mysql
RUN apt-get install -y mysql-server

# && rm -rf /var/lib/apt/lists/*

# # # 安装nginx
RUN apt-get -y install nginx

# # 安装java 
RUN add-apt-repository ppa:openjdk-r/ppa
RUN apt update && apt upgrade -y
RUN apt-get install -y openjdk-17-jre


# 安装ffmpeg
ADD ffmpeg-release-amd64-static.tar.xz /etc/ffmpeg/
ENV PATH="/etc/ffmpeg/ffmpeg-6.1-amd64-static:${PATH}"


# 将jar包添加到容器中并更名为app.jar
ADD easypan-0.0.1-SNAPSHOT.jar /app.jar


COPY setup.sql /setup.sql
COPY init.sql /init.sql


# 把自己本地的html里放的前端项目，放入nginx默认的资源目录里
COPY dist /usr/share/nginx/html
# 将自己的nginx.conf 配置文件放到docker里nginx默认的配置文件位置
COPY nginx.conf /etc/nginx/sites-enabled/default

# 暴露80端口
EXPOSE 80
# # 运行jar包，ENTRYPOINT这条命令只能出现一次，如有多条，则只执行最后一条。该命令只有容器启动时才执行
# ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
CMD ["/entrypoint.sh"]