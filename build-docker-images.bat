REM for windows systems build custom docker containers
docker build -t grafana-plugin -f Dockerfile-grafana .
docker build -t telegraf-docker -f Dockerfile-telegraf .
