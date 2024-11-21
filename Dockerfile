# 使用 nginx 作为基础镜像
FROM nginx:alpine

# 设置工作目录
WORKDIR /usr/share/nginx/html

# 复制所有静态文件到容器中
COPY . .

# 复制自定义的 nginx 配置
COPY nginx.conf /etc/nginx/conf.d/default.conf

# 修改启动用户
RUN sed -i 's/user  nginx/user  root/g' /etc/nginx/nginx.conf

# 暴露 80 端口
EXPOSE 80

# 启动 nginx
CMD ["nginx", "-g", "daemon off;"]