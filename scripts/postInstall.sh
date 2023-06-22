#set env vars
set -o allexport; source .env; set +o allexport;

#wait until the server is ready
echo "Waiting for software to be ready ..."
sleep 75s;

#register the local server in the web ui

target=$(docker-compose port nodebb 4567)

curl http://${target}/ \
  -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7' \
  -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7,he;q=0.6' \
  -H 'cache-control: max-age=0' \
  -H 'content-type: application/x-www-form-urlencoded' \
  -H 'upgrade-insecure-requests: 1' \
  -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36' \
  --data-raw 'url=https%3A%2F%2F'${DOMAIN}:443'&admin%3Ausername=admin&admin%3Aemail='${ADMIN_EMAIL}'&admin%3Apassword='${ADMIN_PASSWORD}'&admin%3ApasswordConfirm='${ADMIN_PASSWORD}'&database=redis&redis%3Ahost=172.17.0.1&redis%3Aport=5069&redis%3Apassword='${REDIS_PASSWORD}'&redis%3Adatabase=0' \
  --compressed

  docker-compose down;

  cat << EOT >> ./nodebb-config/config.json
{
    "url": "https://$DOMAIN:443",
    "secret": "$ADMIN_PASSWORD",
    "database": "redis",
    "port": "4567",
    "redis": {
        "host": "172.17.0.1",
        "port": "6379",
        "password": "${REDIS_PASSWORD}",
        "database": "0"
    }
}
EOT

  sed -i "s~# - ./nodebb-config/config.json:/usr/src/app/config.json~- ./nodebb-config/config.json:/usr/src/app/config.json~g" ./docker-compose.yml

  docker-compose up -d

  sleep 30s;