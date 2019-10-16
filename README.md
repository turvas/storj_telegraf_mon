# storj_telegraf_mon
Success Rates output using StorJ logs and dashboard API with telegraf [inputs.exec] to InfluxDB format. (fork for Windows based dockerhost and TIG stack in docker)

<img src="https://raw.githubusercontent.com/gsxryan/storj_telegraf_mon/master/Dashboard/Preview.png"/>

## Prerequisites

Dockerhost is Windows 10

## Preparations

For generic instructions please look on form fork "master": https://github.com/gsxryan/storj_telegraf_mon

- First of all you have to build few containers (on your dockerhost):
 
 `build-docker-images.bat`

- update docker-compose.yml to match your paths (mine are h:/storj)
- add your crypto token info as described in "master" to tokens.sh
- install telegraf on your (Windows) host , as sescribed in section "B: Installing Telegraf" in https://thenewstack.io/monitoring-windows-services-with-grafana-influxdb-%E2%80%8Eand-telegraf/
  - set in C:\Program Files\Telegraf\telegraf.conf 
    - section [[outputs.influxdb]] to 
      - urls = ["http://127.0.0.1:8086"]
    - if you have cygwin installed you could also move content of [[inputs.exec]] section from docker based telegraf.conf to this host based telegraf config and remove docker/telegraf entirely, you have to (below are somewhat ideas, not yet fully working): 
      - change "commands", most notably path to 3 .sh scripts execution, for example (assuming, you installed this in folder C:\cygwin64\opt\): 
        `commands = ['''C:\cygwin64\bin\mintty /bin/bash -c "PATH=/usr/bin:$PATH; /opt/storj_telegraf_mon/successrate.sh"''']`
      - folder mapping, where your STORJ data directory is for folder_size.sh script argument, for example (assuming h:/storj here):
      `commands = ['''C:\cygwin64\bin\mintty /bin/bash -c "PATH=/usr/bin:$PATH; /opt/storj_telegraf_mon/folder_size.sh /cygdrive/h/storj"''']`

## Start monitoring stack

While in folder, wher docker-compose.yml is located

 `docker-compose up`
 
Access your grafana http://localhost:3000 and perform following tasks: 
- add Dats Source of type InfluxDB, with following parameters:
  - URL: http://influxdb:8086 
  - Database: StorJ
- import  Dashbord (from master) #10554 (from https://grafana.com/grafana/dashboards/10554) or from this repo (for windows tuning): grafana-dashboard.json
