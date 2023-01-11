FROM nginxproxy/nginx-proxy:latest

COPY nginx.conf /etc/nginx/nginx.conf
