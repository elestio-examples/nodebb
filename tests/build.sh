sed -i 's~CMD test -n "${SETUP}" && ./nodebb setup || node ./nodebb build; node ./nodebb start~CMD ./entrypoint.sh \&\& node ./nodebb build; node ./nodebb start~g' ./Dockerfile

docker buildx build . --output type=docker,name=elestio4test/nodebb:latest | docker load