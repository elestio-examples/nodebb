#set env vars
set -o allexport; source .env; set +o allexport;

mkdir -p ./nodebb-data
mkdir -p ./nodebb-files
mkdir -p ./nodebb-config
chmod 777 ./nodebb-data
chmod 777 ./nodebb-files
chmod 777 ./nodebb-config

chmod +x ./entrypoint.sh

