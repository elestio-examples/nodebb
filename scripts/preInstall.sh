#set env vars
set -o allexport; source .env; set +o allexport;

mkdir -p ./build
mkdir -p ./nodebb-data
mkdir -p ./nodebb-files
mkdir -p ./node_modules
chmod 777 ./build
chmod 777 ./nodebb-data
chmod 777 ./nodebb-files
chmod 777 ./node_modules

chmod +x ./entrypoint.sh

