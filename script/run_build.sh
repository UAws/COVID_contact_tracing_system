#!/bin/bash

sql_start
cd ..
export WORKING=`pwd`

mkdir -p $WORKING/backend/src/public/admin
cd $WORKING/backend/src/public || exit
rm -rf ./*


cd $WORKING/frontend/ || exit
npm install
npm run build
cp -rf dist/* $WORKING/backend/src/public


cd $WORKING/frontend-admin/ || exit
npm install
NODE_ENV="production"
npm run build:prod
mkdir -p $WORKING/backend/src/public/admin
cp -rf dist/* $WORKING/backend/src/public/admin/

# current dir ： /backend/
cd $WORKING/backend || exit

cp -rf sql_dump/ormconfig.json ./

mysql --host=127.0.0.1 < sql_dump/dump.sql

if [ -f ./.env ]; then
    sed -i -r 's/app\.listen\(3000\)\;/app\.listen\(8081\)\;/g' ./src/index.ts
    npm install
    npm run start:dev
else
    echo "You must provide google oauth credentials" && exit
fi


