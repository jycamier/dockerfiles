#!/usr/bin/env ash
set -e

export RSA_KEYS

echo 'ANSIBLE | starting ssh-agent'
echo '============================'

eval $(ssh-agent)

for key in $(echo ${RSA_KEYS} | tr ":" "\n")
do
    ssh-add ${key} \
        || echo "The Key ${key} does'n exist"
done

echo '============================'

exec "$@"