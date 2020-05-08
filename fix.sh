#!/usr/bin/env bash

# usage: file_env VAR [DEFAULT]
#    ie: file_env 'XYZ_DB_PASSWORD' 'example'
# (will allow for "$XYZ_DB_PASSWORD_FILE" to fill in the value of
#  "$XYZ_DB_PASSWORD" from a file, especially for Docker's secrets feature)
file_env() {
	local var="$1"
	local fileVar="${var}_FILE"
	local def="${2:-}"
	if [ "${!var:-}" ] && [ "${!fileVar:-}" ]; then
		echo >&2 "error: both $var and $fileVar are set (but are exclusive)"
		exit 1
	fi
	local val="$def"
	if [ "${!var:-}" ]; then
		val="${!var}"
	elif [ "${!fileVar:-}" ]; then
		val="$(< "${!fileVar}")"
	fi
	export "$var"="$val"
	unset "$fileVar"
}
file_env 'PASSWORD'
sudo bash -c "grep -qxF 'export PATH=\"\$PATH:\$HOME/.composer/vendor/bin\"' /etc/skel/.bashrc || echo 'export PATH=\"\$PATH:\$HOME/.composer/vendor/bin\"' >> /etc/skel/.bashrc"
sudo bash -c "grep -qxF 'export PATH=\"\$PATH:\$HOME/.composer/vendor/bin\"' /home/coder/.bashrc || echo 'export PATH=\"\$PATH:\$HOME/.composer/vendor/bin\"' >> /home/coder/.bashrc"
sudo bash -c "grep -qxF 'alias docker=\"sudo docker\"' /etc/skel/.bashrc || echo 'alias docker=\"sudo docker\"' >> /etc/skel/.bashrc"
sudo bash -c "grep -qxF 'alias docker=\"sudo docker\"' /home/coder/.bashrc || echo 'alias docker=\"sudo docker\"' >> /home/coder/.bashrc"
sudo bash -c "grep -qxF 'alias lt=\"lt -h 'http://serverless.social'\"' /etc/skel/.bashrc || echo 'alias lt=\"lt -h 'http://serverless.social'\"' >> /etc/skel/.bashrc"
sudo bash -c "grep -qxF 'alias lt=\"lt -h 'http://serverless.social'\"' /home/coder/.bashrc || echo 'alias lt=\"lt -h 'http://serverless.social'\"' >> /home/coder/.bashrc"
exec /usr/lib/code-server/bin/code-server "$@"
#exec "/usr/local/lib/code-server/node" "/usr/local/lib/code-server/out/node/entry.js" "$@"
