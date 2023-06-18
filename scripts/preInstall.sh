#set env vars
set -o allexport; source .env; set +o allexport;

mkdir -p ./build
mkdir -p ./uploads
mkdir -p ./node_modules
chmod 777 ./build
chmod 777 ./uploads
chmod 777 ./node_modules

chmod +x ./entrypoint.sh

