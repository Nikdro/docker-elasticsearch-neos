[![Docker Build Status](https://img.shields.io/docker/build/nikdro/elasticsearch-neos.svg)]()
# ElasticSearch 2  for Neos Package "Flowpack.ElasticSearch.ContentRepositoryAdaptor"

## What is it? 
This image provides a ElasticSearch instance (Version 2) preconfigured for the Neos Package [Flowpack.ElasticSearch.ContentRepository](https://github.com/Flowpack/Flowpack.ElasticSearch.ContentRepositoryAdaptor)

## Getting started
1. Install all required Packages in Neos. See documentation [here](https://github.com/Flowpack/Flowpack.ElasticSearch.ContentRepositoryAdaptor#installation)
2. Start a container using this image:
    ```
    docker run --name neos-elasticsearch -p 9200:9200 -p 9300:9300 nikdro/elasticsearch-neos #foreground
    docker run -d --name neos-elasticsearch -p 9200:9200 -p 9300:9300 nikdro/elasticsearch-neos #detached
    ```
    
3. Add configuration to Neos (if docker isn't running on localhost)

    Configuration/Settings.yaml:
    ```
    Flowpack:
      ElasticSearch:
        clients:
          default:
            - host: 1.2.3.4 #Ip of your Docker-Host
              port: 9200 #Selected port (if not default)
              username: ''
              password: ''
    ```
    
4. Create index
    ```
    ./flow nodeindex:build #all workspaces
    ./flow nodeindex:build --workspace live #only "live" workspace
    ```
    
5. Be **HAPPY!** :-)


---


## Advanced Setup

### Make ElasticSearch accessible form other hosts
If you are running docker on another Host than Neos, you can make it accessible to other hosts.
Just add `0.0.0.0` to host port:

`docker run -d --name neos-elasticsearch -p 0.0.0.0:9200:9200 -p 0.0.0.0:9301:9300 nikdro/elasticsearch-neos`

Please note step 3 of [Getting started](#getting-started) to configure Neos...


### Save indexes to host
For productive systems, it can be very helpful to store the files of ElasticSearch on the host-system. 
This allows a new container to use the existing index and you don't have to rebuild any index after creating a new container.

Just add a volume to your start-command:

`docker run --name neos-elasticsearch -p 9200:9200 -p 9300:9300 -v ./es-data:/usr/share/elasticsearch/data nikdro/elasticsearch-neos`


## Elastic HQ
The container shipps [Elastic HQ](http://www.elastichq.org). It can be used to browse and monitor your indexes.  
To open the Webinterfache of Elastic HQ, just navigate your browser to `http://localhost:9200/_plugin/hq/`.  
(If your container does not run locally, replace `localhost` with IP/Host of the server)
 
## Questions? Need Help?
There is a Slack-channel for questions about (Elastic)Search at Neos'  Slack: http://slack.neos.io/ #guild-search

### Maintainer
[Niklas Droste (nikdro)](mailto:nd@kaufmann.digital)
