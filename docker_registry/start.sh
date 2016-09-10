docker run -it --rm \
	-p 5000:5000 \
	-v `pwd`/root.crt:/etc/registry/root.crt:ro \
	-v `pwd`/registry.yaml:/etc/docker/registry/config.yml:ro \
	daocloud.io/library/registry:2.4.0
