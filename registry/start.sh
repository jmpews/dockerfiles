docker run -it --rm \
	-p 5000:5000 \
	-v `pwd`/domain.crt:/etc/registry/domain.crt:ro \
	-v `pwd`/registry.yaml:/etc/docker/registry/config.yml:ro \
	registry:2.5
