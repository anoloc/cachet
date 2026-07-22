#!/bin/bash -l

set -e # Exit immediately if a command exits with a non-zero status.

cd ${APP_HOME}

php artisan schedule:run
