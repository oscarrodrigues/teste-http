FROM httpd

ENV WORKDIR="/var/www/html"

LABEL description="Webserver"

WORKDIR $WORKDIR

ADD index.html WORKDIR=$WORKDIR

EXPOSE 80
