# 单独制作 docker 镜像

# FROM 基于基础镜像修改
FROM node:latest

# WORKDIR 指定当前工作目录
WORKDIR /app

# 把容器外的内容 复制到 容器内
COPY . .

# 在容器内执行命令
RUN npm config set registry https://registry.npmmirror.com/

RUN npm install -g http-server

# 声明当前容器要访问的网络端口, 
EXPOSE 8080

# 把 /app 目录设置为挂载点

VOLUME /app

# 容器启动时执行的命令
CMD ["http-server", "-p", "8080"]



# 当我们在 docker 写完基础内容后
# 执行  
# docker build -t name:tag -f filename . (-f 后面跟新文件名称)
# docker build -t aaa:ccc . 

# 根据这个命令就会生成 dockerfile 镜像 
# aaa 为镜像名 (name) ccc 为标签 (tag)

# 完成之后 我们就可以在 docker Desktop images 中就可以看到这个镜像了