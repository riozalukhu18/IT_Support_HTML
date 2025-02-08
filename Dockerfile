FROM nginx:latest

WORKDIR /usr/share/nginx/html

RUN rm -rf ./*

COPY . /usr/share/nginx/html

# Salin config nginx untuk port 81
RUN echo 'server {\n\
    listen 83;\n\
    server_name localhost;\n\
    root /usr/share/nginx/html;\n\
    index index.html;\n\
    location / {\n\
        try_files $uri $uri/ =404;\n\
    }\n\
}' > /etc/nginx/conf.d/default.conf

EXPOSE 83

CMD ["nginx", "-g", "daemon off;"]

