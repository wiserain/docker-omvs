# docker-omvs

Docker images for running [ohhara's OhMulticastVideoScanner](http://ohhara.sarang.net/omvs/).

## TODOs

  - [x] Automate post-processing the ownership of output directory(`omvs_out`)
  - [ ] Restructure project for simple download-and-run
  - [ ] Implement environment variables for passing options to `omvs` executable

## Using docker-compose

In order to build docker image, `docker-compose.yml` should be placed one-level above docker-omvs repository.
Before running `docker-compose`, please make `config` directory next to `docker-compose.yml` and copy/paste `IPTV_ADDRESS` into `config`.

Otherwise you can modify `docker-compose.yml` to suit your need.

``` 
cp docker-compose.yml.sample ../docker-compose.yml

cd ../

docker-compose build
docker-compose up --no-start
docker-compose start
```

Or you can just run `docker-compose` with just the following one:

```
docker-compose up -d
```

## Using docker run

First, run your container.

```bash
docker run -it \
	--net=host \
	-v ${PWD}/omvs_out:/omvs_out \
	wiserain/omvs
```

Then, give your own omvs command inside running container.

```bash
omvs -i 0 -j 2 <ip1> <ip2> ...
```

As permission handling is not implemented, you shoud change the ownership of ```omvs_out``` folder manually by

```bash
sudo chown ${USER:=$(/usr/bin/id -run)}:$USER ${PWD}/omvs_out
```
