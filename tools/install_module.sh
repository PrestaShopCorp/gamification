#!/bin/bash

echo Install Module "$1"

# Build Module Dependencies
cd $MODULE_DIR
composer update --prefer-dist --no-interaction --no-progress

# Move Module Contents to Install Folder
echo Move Module Contents to Prestashop Modules Directory

cd $TRAVIS_BUILD_DIR
rm -Rf     $TRAVIS_BUILD_DIR/modules/$1/*
cp -Rf    $MODULE_DIR/*              $TRAVIS_BUILD_DIR/modules/$1/

# Enable the Module
php bin/console prestashop:module install $1
