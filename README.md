# WE1S notebook viewer

A simple web viewer for browsing we1s model visualizations published as HTML+JavaScript websites. Empty directories on the site are auto-indexed in order to make it easy to publish visualization sites into many site subdirectories and navigate them on-the-fly.

Tested with [dfr-browser](http://agoldst.github.io/dfr-browser) and [topic-bubbles](https://github.com/sihwapark/topic-bubbles) site output.

The viewer is packaged as a Docker container running the nginx webserver on an Alpine Linux virtual machine. Based on a configuration of an nginx official image.


## use

While it is possible to run this container and serve web contents from a mounted volume using `docker run -v myvolume`, this container is designed to be linked to other containers by running `docker compose` or `docker swarm` in the same directory with a valid `docker-compose.yml` or `docker-cloud.yml` file that specifies their shared volumes.

Specifically, in the we1s-cloud this container mounts as read-only a volume that is also mounted by the we1s-notebook Jupyter Notebook environment. Notebooks can then write visualization outputs to that volume in order to publish them to the web.

 For more details, see [we1s-cloud](https://github.com/whatevery1says/we1s-cloud).


## remote installation

A simple Docker swarm example is given in `docker-cloud.yml`. 

    docker swarm init
    docker stack deploy --compose-file docker-cloud.yml we1s

This will download two pre-built images from Docker Hub for a notebook and this notebook-viewer, then launch two containers and mount a shared volume between them. The Jupyter notebook is available on port 8888, the web viewer on port 10002. 

Files saved to the to the shared volume from the Jupyter notebook environment at `~/work/view` will be web viewable on port 10002.


## local installation

To customize this viewer:

1. download or `git clone https://github.com/whatevery1says/we1s-notebook-viewer.git`
2. make changes as needed, e.g. to configuration file: `nginx.vh.default.conf`
3. build a local image and name it:

      docker build we1s-notebook-viewer .

4. alter the `docker-cloud.yml` file to point to the new local image

      # image: jeremydouglass/we1s-notebook-viewer:latest
      image: we1s-notebook-viewer

5. launch the stack on Docker:

      docker swarm init
      docker stack deploy --compose-file docker-cloud.yml we1s


## source

Based on the official [nginx docker image](https://hub.docker.com/_/nginx/), version pinned.

It has been modified:

-  [autoindex](http://nginx.org/en/docs/http/ngx_http_autoindex_module.html#example) is enabled for full directory navigation
