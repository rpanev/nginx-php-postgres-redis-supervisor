# Pull base image.
FROM ubuntu

# Install Supervisor and php
RUN \
  apt-get update && \
  apt-get install -y supervisor &&\
  apt-get install -y software-properties-common &&\
  add-apt-repository ppa:ondrej/php && \
  apt-get update && \
  apt-get install -y php7.3 php7.3-bcmath php7.3-bz2 \
  php7.3-curl php7.3-dba php7.3-gd php7.3-zip php7.3-xml \
  php7.3-soap php7.3-mbstring php7.3-mysql php7.3-fpm \
  php7.3-opcache php7.3-intl php7.3-redis php7.3-sqlite3 \
  php7.3-pgsql && \
  rm -rf /var/lib/apt/lists/* 
#  sed -i 's/^\(\[supervisord\]\)$/\1\nnodaemon=true/' /etc/supervisor/supervisord.conf

# Define mountable directories.
#VOLUME ["/etc/supervisor/conf.d"]

# Define working directory.
WORKDIR /

CMD service supervisor start && service php7.3-fpm start && tail -F /var/log/lastlog
# Define default command.
#CMD ["supervisord", "-c", "/etc/supervisor/supervisord.conf"]

