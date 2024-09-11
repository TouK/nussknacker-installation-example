#!/bin/bash

set -e

RESULT=$(psql -tc "SELECT 1 FROM pg_database WHERE datname = '$DB';")

if [ -z "$RESULT" ]; then
  echo "Database $DB does not exist. Creating..."
  psql -v ON_ERROR_STOP=1 <<-EOSQL
    CREATE USER $USER WITH ENCRYPTED PASSWORD '$PASSWORD';
    CREATE DATABASE $DB;
    ALTER DATABASE $DB OWNER TO $USER;
EOSQL

else
  echo "Database $DB already exists."
fi