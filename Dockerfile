# базовый образ
FROM nginx:alpine

# Создаем папку для пользовательского конфигурационного файла
RUN mkdir -p /etc/nginx/conf.d

# Создаем конфиг для nginx, включающий запрет для запросов
RUN echo 'server { \
    listen 80; \
    server_name localhost; \
    location / { \
        limit_except POST { \
            deny all; \
        } \
        # Обработка POST-запросов с ответом 200 OK \
        add_header Content-Type text/plain; \
        return 200 "POST request accepted\n"; \
    } \
}' > /etc/nginx/conf.d/default.conf

# Запуск NGINX
CMD ["nginx", "-g", "daemon off;"]




