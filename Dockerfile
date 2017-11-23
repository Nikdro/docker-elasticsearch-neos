FROM elasticsearch:2.4
MAINTAINER Niklas Droste <nd@kaufmann.digital>

ADD config /usr/share/elasticsearch/config

RUN plugin install royrusso/elasticsearch-HQ/v2.0.3
