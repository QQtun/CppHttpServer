# 使用官方的 Ubuntu 基础镜像
FROM ubuntu

# 设置非交互式模式以避免安装过程中要求输入
ENV DEBIAN_FRONTEND=noninteractive

# 安装必要的工具和库
RUN apt-get update && apt-get install -y \
    cmake \
    g++ \
    libboost-all-dev \
    && rm -rf /var/lib/apt/lists/*

# 创建并设置工作目录
WORKDIR /app

# 复制项目文件到工作目录
COPY HttpWebSocketServer .

# 创建 build 目录并进入
RUN chmod +x HttpWebSocketServer

# 设置默认命令来运行生成的可执行文件
CMD ["./HttpWebSocketServer"]
