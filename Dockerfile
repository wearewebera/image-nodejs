FROM webera/base

ENV PATH "/usr/local/sbin:/usr/sbin:/sbin:/usr/local/bin:/usr/bin:/bin"
ENV NODE_VERSION 16.x

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
     ca-certificates curl openssl gnupg2 git \
  && curl -sL https://deb.nodesource.com/setup_${NODE_VERSION} | bash - \
  && apt-get install -y --no-install-recommends nodejs \
  && npm cache clean -f \
  && npm install -g npm yarn \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
