#!/bin/bash -l

export CACHET_TRUSTED_PROXIES="$CC_REVERSE_PROXY_IPS"

cd ${APP_HOME}

php artisan optimize

if [ "${DB_CONNECTION}" = "sqlite" ] && ! [ -e "${DB_DATABASE}" ] ; then
    touch "${DB_DATABASE}"

    php artisan migrate --force
fi

php artisan migrate:status --pending | grep " Pending" >> /dev/null

if [[ $? == 0 ]]; then
    echo "Migration required…"

    php artisan down --retry 10

    sleep 2
    php artisan migrate --force || exit 1

    php artisan up
else
    echo "Nothing to migrate!"
fi
