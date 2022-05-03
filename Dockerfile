FROM gcr.io/webera/base

ENV NODE_VERSION 18.0.0
ENV YARN_VERSION 1.22.18

RUN apt-get update \
  && apt-get install -y curl \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN curl -s https://deb.nodesource.com/setup_18.x | bash 
    
RUN apt-get update \
    && apt-get install -y nodejs  \
    && apt-get clean \
    && apt-get remove -y curl \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && npm install --global yarn

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]
CMD [ "node" ]