# storj_telegraf_mon
Success Rates output using StorJ logs with telegraf [inputs.exec] to InfluxDB format. (fork for Windows based dockerhost and TIG stack in docker)

<img src="https://raw.githubusercontent.com/gsxryan/storj_telegraf_mon/master/Dashboard/Preview.png"/>

## Prerequisites

Dockerhost is Windows 10

## Preparations

For generic instructions please look on form fork "master": https://github.com/gsxryan/storj_telegraf_mon

- First of all you have to build few containers (on your dockerhost):
 
 `build-docker-images.bat`

- update docker-compose.yml to match your paths (mine are h:/storj)
- add your crypto token info as described in "master" to tokens.sh

## Start monitoring stack

While in folder, wher docker-compose.yml is located

 `docker-compose up`
 
Access your dashbord:
 'http://localhost:3000'
