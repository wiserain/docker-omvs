# docker-omvs

Docker images for running [ohhara's OhMulticastVideoScanner](http://ohhara.sarang.net/omvs/).

```bash
docker run -it \
	--net=host \
	-v ${PWD}/omvs_out:/omvs_out \
	wiserain/omvs
```
