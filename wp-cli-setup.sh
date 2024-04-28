#! /usr/bin/env bash
set -e
set -x

#wp config list --format=dotenv

#if ! wp core is-installed
#then
    wp core install --url=localhost --title='Test Site' --admin_user=adminuser \
        --skip-email --admin_email=bozo@example.com
    # TODO: trap the auto-generated password; or set it expicitly
#fi

wp plugin delete hello akismet
#if ! wp plugin is-installed simply-static
#then
    wp plugin install simply-static --activate
#fi

wp theme delete twentytwentythree twentytwentytwo

wp config list --format=dotenv
