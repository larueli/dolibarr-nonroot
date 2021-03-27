#!/bin/bash
if [ ! "$(ls -A /var/www/html/htdocs/conf)" ]; then
    cd /tmp
    tar -xzf dolibarr-${DOLIBARR_VERSION}.tgz
    shopt -s dotglob
    mv -f dolibarr-${DOLIBARR_VERSION}/htdocs/conf/* /var/www/html/htdocs/conf/
    rm -rf dolibarr-${DOLIBARR_VERSION}
fi
if [ ! "$(ls -A /var/www/html/scripts)" ]; then
    cd /tmp
    tar -xzf dolibarr-${DOLIBARR_VERSION}.tgz
    mv -f dolibarr-${DOLIBARR_VERSION}/scripts/* /var/www/html/scripts/
    rm -rf dolibarr-${DOLIBARR_VERSION}
fi
