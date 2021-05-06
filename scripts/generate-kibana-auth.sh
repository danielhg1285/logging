#!/usr/bin/env bash

# generate-kibana-auth.sh
# Generates new httpass file for kibana authentication

CLOUD_HOME=$(dirname $(pwd))
AUTH_FOLDER="$CLOUD_HOME/auth"
HTTP_PASSWORD_FILE="$AUTH_FOLDER/.kibana.auth"

configure_authentication(){
    read -p "Enter Kibana username: " user
    echo "Enter Kibana user password"
    htpasswd -c $HTTP_PASSWORD_FILE $user
    chmod 600 $HTTP_PASSWORD_FILE
}

mkdir -p $AUTH_FOLDER

# Configure credentials file
echo "Configuring share authentication"
configure_authentication $HTTP_PASSWORD_FILE