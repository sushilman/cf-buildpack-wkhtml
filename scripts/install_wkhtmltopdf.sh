#!/bin/bash
set -e

BUILD_DIR=$1
CACHE_DIR=$2

BIN_PATH="$BUILD_DIR/bin"
TMP_PATH="$BUILD_DIR/tmp"
mkdir -p $CACHE_DIR $BIN_PATH $TMP_PATH

WKHTMLTOPDF_LOCATION="$BUILDPACK_DIR/resources/wkhtmltox_0.12.5-1.trusty_amd64.deb"
WKHTMLTOPDF_PKG="$CACHE_DIR/wkhtmltopdf.deb"
WKHTMLTOPDF_PATH="$TMP_PATH/wkhtmltopdf"
WKHTMLTOPDF_BINARIES="$WKHTMLTOPDF_PATH/usr/local/bin"

BIN_DIR=$(cd $(dirname $0); pwd)

if [ -f $WKHTMLTOPDF_PKG ]; then
  echo "-----> Using wkhtmltopdf Debian package from cache"
else
  echo "-----> Copying wkhtmltopdf Debian package"
  cp $WKHTMLTOPDF_LOCATION $WKHTMLTOPDF_PKG
fi

echo "-----> Unpacking Debian package"
dpkg -x $WKHTMLTOPDF_PKG $WKHTMLTOPDF_PATH

echo "-----> Setting permissions"
chmod +x $WKHTMLTOPDF_BINARIES/*

echo "-----> Moving binaries to the right place"
mv $WKHTMLTOPDF_BINARIES/* $BIN_PATH/

echo "-----> Cleaning up"
rm -rf $WKHTMLTOPDF_PATH
