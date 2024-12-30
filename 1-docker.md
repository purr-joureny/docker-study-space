# docker-study

- dockerfile 是在 docker build 时 docker 守护进程进行的 而不是命令行
- 在启动 docker daemon 之后才可以进行 docker build

- 命令行工具 和 docker daemon 交互来实现各种功能

- 比如在 docker build 的时候 会把 dockerfile 和它的构建上下文 (也就是所在目录) 打包发送给 docker daemon 来构建镜像

```csharp
docker build -t name:tag -f filename .
```

- . 为构建的上下文目录 (也可以指定别的命令)
- 镜像自然是越小越好 所以 docker 支持通过 .dockerignore 声明哪些不需要发送给 docker daemon

- 示例

```csharp
*.md
!README.md
node_modules/
[a-c].txt
.git/
.DS_Store
.vscode/
.dockerignore
.eslintignore
.eslintrc
.prettierrc
.prettierignore
```

- 而在 docker build 时会先解析 .dockerignore, 忽略里面的文件
  - 然后再 根据 dockerfile 里面的 FROM WORKDIR ... 执行里面的内容
  - 这一切都是在 docker daemon 启动时(中)执行的
- 把剩余的文件打包发送给 docker daemon 作为上下文来构建产生镜像

- 多阶段构建
  - 将源码目录发送到 docker daemon 中执行 npm run build 来构建产物
  - 之后再 执行 node ./dist/main.js 运行服务
