#########################################
# Dockerfile to build NGINX server image
#########################################
# Base image
FROM nginx:latest

# Author: MobileSnapp Inc.
MAINTAINER MobileSnapp <support@mobilesnapp.com>

# Add docker config
ADD nginx.conf /etc/nginx/

# Define mountable directories.
VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx"]

# Add configuration for default site
#ADD local.conf /etc/nginx/sites-available/

# Add configuration for custom site [Comment it for default site]
ADD site.conf /etc/nginx/sites-available/

RUN ln -s /etc/nginx/sites-available/site.conf /etc/nginx/sites-enabled

# Assign working directory
WORKDIR /var/www/site/

# Expose web and SSL ports.
EXPOSE 80
EXPOSE 443

CMD ["nginx"]
