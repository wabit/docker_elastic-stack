# docker_elastic-stack
Provides a three node elasticseach cluster with SSL enabled along with a Kibana instance.

all this does is follows elastics guide to getting a cluster configured usign docker but using a single command more details can be found here: 
https://www.elastic.co/guide/en/elastic-stack-get-started/master/get-started-docker.html

### Requirements:
* MacOS (sorry windows users)
* Docker for Mac
* Docker Engine is allotted at least 4GiB of memory (more if you can). In Docker Desktop, you configure resource usage on the Advanced tab in Preference.
* Brew is installed (used incase you dont have gsed isntalled)

### Install:

```./setup.sh```

### Start/Stop/Remove

to just stop the current cluster without loosing data
```docker-compose -f elastic-docker-tls.yml down```

to complete remove all container/config and volumes
```docker-compose -f elastic-docker-tls.yml down -v```

to start up the cluster once its been shutdown
```docker-compose -f elastic-docker-tls.yml up -d```
