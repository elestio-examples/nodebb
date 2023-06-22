
sed -i "s~FROM --platform=\$BUILDPLATFORM node:lts as npm~FROM node:lts as npm~g" ./Dockerfile;
sed -i 's~CMD test -n "${SETUP}" && ./nodebb setup || node ./nodebb build; node ./nodebb start~CMD ./entrypoint.sh \&\& node ./nodebb build; node ./nodebb start~g' ./Dockerfile




docker build . --tag elestio4test/nodebb:latest