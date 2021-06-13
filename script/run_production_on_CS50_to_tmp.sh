#!/bin/bash

export BASEDIR=/tmp/project
cd ..
export WORKING=`pwd`

sql_start

rm -rf $BASEDIR
mkdir $BASEDIR
cd $BASEDIR
cp -r $WORKING/backend ./

mkdir -p backend/src/public/admin
cd backend/src/public || exit
#rm -rf ./*
curl -s https://api.github.com/repos/UAws/COVID_contact_tracing_system/releases/latest \
| grep "frontend-admin.zip.zip" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -i -

curl -s https://api.github.com/repos/UAws/COVID_contact_tracing_system/releases/latest \
| grep "frontend.zip.zip" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -i -

unzip frontend-admin.zip.zip
unzip frontend-admin.zip
mkdir admin
cp -rf ./dist/* admin/

rm -rf "./dist"

unzip frontend.zip.zip
unzip frontend.zip
cp -rf ./dist/* ./

rm -rf ./*.zip
# current dir ： /backend/
cd ../.. || exit

cp -rf sql_dump/ormconfig.json ./

mysql --host=127.0.0.1 < sql_dump/dump.sql

if [ -f ./.env ]; then
    sed -i -r 's/app\.listen\(3000\)\;/app\.listen\(8081\)\;/g' ./src/index.ts
    npm install
    npm run start:dev
else
    echo "You must provide google oauth credentials" && exit
fi


