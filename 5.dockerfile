FROM node:22.12.0-alpine3.21

ADD ./test.tar.gz ./test-add

COPY ./test.tar.gz ./test-copy

# 添加一个持久运行的命令
CMD ["tail", "-f", "/dev/null"]