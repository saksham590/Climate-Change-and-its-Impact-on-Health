#!/bin/bash

docker stop breast-cancer-app 2>/dev/null
docker rm breast-cancer-app 2>/dev/null

docker build -t breast-cancer-app .

docker run -d -p 8501:8501 --name breast-cancer-app breast-cancer-app
