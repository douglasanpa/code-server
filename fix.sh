#!/usr/bin/env sh
sudo bash -c "grep -qxF 'export PATH=\"\$PATH:\$HOME/.composer/vendor/bin\"' /etc/skel/.bashrc || echo 'export PATH=\"\$PATH:\$HOME/.composer/vendor/bin\"' >> /etc/skel/.bashrc"
sudo bash -c "grep -qxF 'export PATH=\"\$PATH:\$HOME/.composer/vendor/bin\"' /home/coder/.bashrc || echo 'export PATH=\"\$PATH:\$HOME/.composer/vendor/bin\"' >> /home/coder/.bashrc"
sudo bash -c "grep -qxF 'alias docker=\"sudo docker\"' /etc/skel/.bashrc || echo 'alias docker=\"sudo docker\"' >> /etc/skel/.bashrc"
sudo bash -c "grep -qxF 'alias docker=\"sudo docker\"' /home/coder/.bashrc || echo 'alias docker=\"sudo docker\"' >> /home/coder/.bashrc"
sudo bash -c "grep -qxF 'alias lt=\"lt -h 'http://serverless.social'\"' /etc/skel/.bashrc || echo 'alias lt=\"lt -h 'http://serverless.social'\"' >> /etc/skel/.bashrc"
sudo bash -c "grep -qxF 'alias lt=\"lt -h 'http://serverless.social'\"' /home/coder/.bashrc || echo 'alias lt=\"lt -h 'http://serverless.social'\"' >> /home/coder/.bashrc"
exec "/usr/local/lib/code-server/node" "/usr/local/lib/code-server/out/node/entry.js" "$@ --disable-ssh"