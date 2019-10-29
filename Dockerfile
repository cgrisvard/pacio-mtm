FROM centos:8
RUN yum install -y --setopt=tsflags=nodocs httpd composer-cli nodejs php wget git yum-utils php-json php-zip php-pdo php-mbstring php-dom php-gd php-curl
ADD run-httpd.sh /run-httpd.sh
RUN chmod -v +x /run-httpd.sh
CMD ["/run-httpd.sh"]
RUN npm config set registry https://artifactory-principale.enedis.fr/artifactory/api/npm/proxy-npm-npmjs/ && composer install && npm install && npm run production
