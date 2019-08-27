FROM httpd

ENV WORDKDIR="/var/www/html"

LABEL description="Webserver"

WORDKDIR $WORDKDIR

ADD index.html WORKDIR=$WORKDIR

EXPOSE 80
