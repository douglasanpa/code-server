FROM codercom/code-server
RUN sudo apt-get update && \
    sudo DEBIAN_FRONTEND=noninteractive apt-get -y install lsb-release net-tools php php-gd php-mbstring php-xml php-zip php-mysql wget nano gcc g++ make libpng-dev dh-autoreconf libpng++-dev pkg-config autoconf libtool nasm unzip php-curl mariadb-client docker-compose nfs-common && \
    echo 'deb https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/Debian_10/ /' sudo tee /etc/apt/sources.list.d/devel:kubic:libcontainers:stable.list &&\
    curl -L https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/Debian_10/Release.key | sudo apt-key add - &&\
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list && \
    curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash - && \
    sudo apt-get -y install nodejs yarn podman && \
    sudo usermod -aG docker coder && \
    curl -sS https://getcomposer.org/installer | php && \
    sudo mv composer.phar /usr/local/bin/composer && \
    sudo chmod +x /usr/local/bin/composer && \
    composer global require laravel/installer &&\
    export PATH="$PATH:$HOME/.composer/vendor/bin" &&\
    sudo bash -c "grep -qxF 'alias docker=podman' /etc/skel/.bashrc || echo 'alias docker=podman' >> /etc/skel/.bashrc"  &&\
    sudo bash -c "grep -qxF 'alias docker=podman' /home/coder/.bashrc || echo 'alias docker=podman' >> /home/coder/.bashrc" &&\
    sudo bash -c "grep -qxF 'alias docker=podman' /root/.bashrc || echo 'alias docker=podman' >> /root/.bashrc"

