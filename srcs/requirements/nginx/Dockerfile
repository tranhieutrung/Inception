FROM alpine:3.22.0

RUN apk update && apk add \
	nginx gettext openssl bash

COPY conf/default.conf /etc/nginx/http.d/default.conf
COPY tools/entrypoint.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/entrypoint.sh && \
	mkdir -p /etc/nginx/ssl

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
