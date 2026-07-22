#!/bin/bash -l

set -e # Exit immediately if a command exits with a non-zero status.

cd ${APP_HOME}

composer update cachethq/core

php artisan vendor:publish --tag=cachet

php artisan livewire:publish --assets
