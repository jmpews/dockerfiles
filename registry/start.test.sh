docker run -it --rm \
	-p 5000:5000 \
	-v `pwd`/certs:/certs \
	-e REGISTRY_HTTP_TLS_CERTIFICATE=/certs/domain.crt \
	-e REGISTRY_HTTP_TLS_KEY=/certs/domain.key \
	registry:2.5
