#set env vars
#set -o allexport; source .env; set +o allexport;


mkdir -p ./mongo
chown -R 1000:1000 ./mongo
