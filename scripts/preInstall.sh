#set env vars
set -o allexport; source .env; set +o allexport;

sed -i "s/INSTANCE_DOMAIN/$DOMAIN/g" ./scripts/mongo_setup.sh

sed -i "s/SOFTWARE_PASSWORD/$ADMIN_PASSWORD/g" ./scripts/mongo_setup.sh

mkdir -p ./auth;
echo $(openssl rand -hex 20) > ./auth/key;
chmod 600 ./auth/key 



mkdir -p ./mongo
chown -R 1000:1000 ./mongo
