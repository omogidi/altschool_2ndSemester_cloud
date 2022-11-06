#!/bin/bash

# Check if user is already created in postgresql
USER_EXISTS=$(psql -tAc "SELECT 1 FROM pg_roles WHERE rolname='$DB_USERNAME'")
if [ "$USER_EXISTS" != '1' ]; then
    # Create user and database
    psql -U postgres -c "CREATE USER $DB_USERNAME WITH PASSWORD '$DB_PASSWORD';"
else
    echo "User already exists"
fi

# Check if database is already created in postgresql
DB_EXISTS=$(psql -tAc "SELECT 1 FROM pg_database WHERE datname='$DB_DATABASE'")
if [ "$DB_EXISTS" != '1' ]; then
    # Create database
    psql -U postgres -c "CREATE DATABASE $DB_DATABASE OWNER $DB_USERNAME;"
else
    echo "Database already exists"
fi
