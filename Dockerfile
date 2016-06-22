#########################################
# Dockerfile to build NGINX server image
#########################################
# Base image
FROM nginx:latest

# Author: MobileSnapp Inc.
MAINTAINER MobileSnapp <support@mobilesnapp.com>

# Add docker config
COPY nginx.conf /etc/nginx/nginx.conf

# Define mountable directories.
VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx"]

# Grant Permissions
RUN chown -R www-data:www-data /var/www/site/public
RUN chmod 755 /var/www

# Assign working directory
WORKDIR /var/www/site/

# Expose web and SSL ports.
EXPOSE 80
EXPOSE 443

CMD ["nginx"]
