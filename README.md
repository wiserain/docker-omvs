# docker-omvs

Docker images for running [ohhara's OhMulticastVideoScanner](http://ohhara.sarang.net/omvs/).

## Usage

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
