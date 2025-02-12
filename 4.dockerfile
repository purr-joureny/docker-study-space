FROM node:22.12.0-alpine3.21

ARG name


# CMD 指令内容是可以在命令行中执行时被重写的
CMD ["echo", "hello CMD", "$name"]

# 而 ENTRYPOINT 指令内容在执行时是不能被重写的
ENTRYPOINT ["echo", "hello ENTRYPOINT", "$name"]