#!/bin/bash
set -e

BUILD_DIR=$1
CACHE_DIR=$2

CERT_PATH="$BUILD_DIR/usr/share/ca-certificates"
mkdir -p $CACHE_DIR $CERT_PATH

CACERT_URL="https://curl.haxx.se/ca/cacert.pem"
CACERT_PKG="$CACHE_DIR/cacert.pem"

echo "-----> Downloading cacert"
curl -L $CACERT_URL -o $CACERT_PKG

echo "-----> Moving certificate to the right place"
mv $CACERT_PKG $CERT_PATH/
