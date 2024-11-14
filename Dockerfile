# 使用 openjdk 镜像作为运行时环境
FROM openjdk:8-jre-alpine

# 设置工作目录
WORKDIR /app

# 将构建生成的 JAR 文件复制到镜像中
COPY target/*.jar app.jar

# 暴露容器的端口 8080
EXPOSE 8080

# 设置容器启动时执行的命令
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
