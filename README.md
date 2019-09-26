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
- install telegraf on your (Windows) host , as sescribed in section "B: Installing Telegraf: in https://thenewstack.io/monitoring-windows-services-with-grafana-influxdb-%E2%80%8Eand-telegraf/
  - set in telegraf.con section [[outputs.influxdb]] to 
    - urls = ["http://127.0.0.1:8086"]

## Start monitoring stack

While in folder, wher docker-compose.yml is located

 `docker-compose up`
 
Access your grafana http://localhost:3000 and perform following tasks:
 
 
- add Dats Source of type InfluxDB, with following parameters:
  - URL: http://influxdb:8086 
  - Database: StorJ
- import  Dashbord (from master) #10554 (from https://grafana.com/grafana/dashboards/10554) or from this repo (for windows tuning): grafana-dashboard.json
