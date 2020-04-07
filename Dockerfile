FROM codercom/code-server
RUN sudo apt-get update && \
    sudo DEBIAN_FRONTEND=noninteractive apt-get -y install lsb-release net-tools php php-gd php-mbstring php-xml php-zip php-mysql wget nano gcc g++ make libpng-dev dh-autoreconf libpng++-dev pkg-config autoconf libtool nasm unzip php-curl mariadb-client docker-compose nfs-common && \
    sudo usermod -aG docker coder && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list && \
    curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash - && \
    sudo apt-get -y install nodejs yarn && \
    curl -sS https://getcomposer.org/installer | php && \
    sudo mv composer.phar /usr/local/bin/composer && \
    sudo chmod +x /usr/local/bin/composer && \
    composer global require laravel/installer &&\
    export PATH="$PATH:$HOME/.composer/vendor/bin" &&\
    sudo bash -c "grep -qxF 'sudo chown coder.coder /var/run/docker.sock' /etc/skel/.bashrc || echo 'sudo chown coder.coder /var/run/docker.sock' >> /etc/skel/.bashrc"  &&\
    sudo bash -c "grep -qxF 'sudo chown coder.coder /var/run/docker.sock' /home/coder/.bashrc || echo 'sudo chown coder.coder /var/run/docker.sock' >> /home/coder/.bashrc" &&\
    sudo bash -c "grep -qxF 'sudo chown coder.coder /var/run/docker.sock' /root/.bashrc || echo 'sudo chown coder.coder /var/run/docker.sock' >> /root/.bashrc" &&\

