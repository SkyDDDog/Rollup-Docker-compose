FROM nginx

MAINTAINER Sky_Dog<362664609@qq.com>

COPY dist/ /usr/share/nginx/html/

COPY default.conf /etc/nginx/conf.d/default.conf

VOLUME ["/usr/share/nginx/html"]

EXPOSE 80