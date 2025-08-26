ARG STACK_VERSION
FROM docker.elastic.co/elasticsearch/elasticsearch:${STACK_VERSION}
USER root
COPY . /usr/share/elasticsearch

RUN chown -R elasticsearch:elasticsearch /usr/share/elasticsearch; \
    chmod +x /usr/share/elasticsearch/initialize.sh
USER elasticsearch
ENTRYPOINT ["/usr/share/elasticsearch/initialize.sh"]