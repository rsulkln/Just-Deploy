#!/bin/sh

if ["DATABASE" = "postgres"] 
then 
    echo "please waiting "

    while ! nc -z $SQL_HOST $SQL_PORT: do 
        sleep 0.1
    done
    echo "Postgres started"
fi

python3 manage.py migrate

exec "$@"
