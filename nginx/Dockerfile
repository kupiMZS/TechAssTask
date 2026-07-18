FROM nginx:alpine

# Install envsubst
RUN apk add --no-cache gettext

# Copy template config
COPY nginx.conf /etc/nginx/nginx.conf.template

# Replace variables and start nginx
CMD envsubst '${NGINX_PORT} ${DOMAIN_NAME} ${SITE1_PORT} ${SITE2_PORT}' \
    < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf \
    && nginx -g 'daemon off;'