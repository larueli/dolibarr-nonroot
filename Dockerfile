FROM larueli/php-base-image:7.4

ARG DOLIBARR_VERSION=14.0.5
ENV DOLIBARR_VERSION=${DOLIBARR_VERSION}

USER 0
COPY deploy.sh /docker-entrypoint-init.d/

RUN cd /tmp && wget "https://downloads.sourceforge.net/project/dolibarr/Dolibarr%20ERP-CRM/${DOLIBARR_VERSION}/dolibarr-${DOLIBARR_VERSION}.tgz" && \
    tar -xzf dolibarr-${DOLIBARR_VERSION}.tgz && rm -rf /var/www/html && mv dolibarr-${DOLIBARR_VERSION} /var/www/html && \
    chgrp -R 0 /var/www/html && chmod -R g+rwx /var/www/html

ENV APACHE_DOCUMENT_ROOT=/var/www/html/htdocs

USER 545622:0
