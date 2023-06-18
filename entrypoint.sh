#!/bin/bash

echo "Installing plugins..."

npm install nodebb-plugin-calendar && ./nodebb activate nodebb-plugin-calendar
npm install nodebb-plugin-blog-comments && ./nodebb activate nodebb-plugin-blog-comments