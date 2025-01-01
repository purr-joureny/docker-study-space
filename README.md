# docker study

拉取项目代码

- git pull

打开 dockerfile-test 项目文件

- cd dockerfile-test

运行 docker 命令构建容器

- docker build -t name:tag .

- `-t` 指定 name:tag

- `.` 当前目录结构

指定 端口 后台运行

- docker run -d -p 3000:3000 --name nest-Contreras name:tag

- `-d` 后台运行

- `-p` 指定端口

- `--name` 指定容器名称
