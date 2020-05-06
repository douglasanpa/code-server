FROM codercom/code-server:3.2.0
COPY fix.sh ngrok localhost.run serveo /usr/local/bin/
RUN sudo apt-get -qq update && \
    sudo DEBIAN_FRONTEND=noninteractive apt-get -qq -y install  gnupg2 pass lsb-release net-tools php php-gd php-mbstring php-xml php-zip php-mysql wget nano gcc g++ make libpng-dev dh-autoreconf libpng++-dev pkg-config autoconf libtool nasm unzip php-curl mariadb-client docker-compose nfs-common && \
    sudo usermod -aG docker coder && \
    curl -L https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/Debian_10/Release.key | sudo apt-key add - &&\
    echo 'deb https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/Debian_10/ /'| sudo tee /etc/apt/sources.list.d/podman.list &&\
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list && \
    curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash - && \
    sudo apt-get -qq -y install nodejs yarn podman && \
    curl -sS https://getcomposer.org/installer | php && \
    sudo mv composer.phar /usr/local/bin/composer && \
    sudo chmod +x /usr/local/bin/composer && \
    composer global require laravel/installer &&\
    composer global require friendsofphp/php-cs-fixer &&\
    composer global require "squizlabs/php_codesniffer=*" &&\
    export PATH="$PATH:$HOME/.composer/vendor/bin" &&\
    sudo npm install -g localtunnel &&\
    sudo chmod +x /usr/local/bin/fix.sh &&\
    sudo chmod +x /usr/local/bin/ngrok &&\
    sudo chmod +x /usr/local/bin/localhost.run &&\
    sudo chmod +x /usr/local/bin/serveo &&\
    curl https://www.teleconsole.com/get.sh | sh &&\
    sudo apt-get clean && sudo rm -rf /var/lib/apt/lists/*
#RUN sudo bash -c "sed -n '1p' -i /usr/bin/code-server" &&\
#    sudo bash -c "echo \"/usr/local/bin/fix.sh \\\$@\" >> /usr/bin/code-server"
    
