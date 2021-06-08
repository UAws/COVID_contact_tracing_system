#!/bin/bash

sql_start

cd ..
mkdir -p backend/src/public/admin
cd backend/src/public || exit

unzip frontend-admin.zip*.zip
unzip frontend-admin.zip
cp -rf ./dist/* admin/

rm -rf "./dist"

unzip frontend.zip*.zip
unzip frontend.zip
cp -rf ./dist/* ./

rm -rf ./*.zip
# current dir ： /backend/
cd .. || exit

cp -rf sql_dump/ormconfig.json ./

mysql --host=127.0.0.1 < sql_dump/dump.sql

if [ -f ./.env ]; then
    npm install
    npm run start:dev
else
    echo "You must provide google oauth credentials" && exit
fi


