FROM "gcr.io/huntingmill/common/base:latest"

ENV PATH "/usr/local/sbin:/usr/sbin:/sbin:/usr/local/bin:/usr/bin:/bin"
ENV NODE_VERSION 18.x

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    xz-utils \
    openssl \
    gnupg2 \
    git \
    nodejs \
    npm \
  && npm cache clean -f \
  && npm install -g npm yarn \
  && curl -sL https://deb.nodesource.com/setup_${NODE_VERSION} | bash - \
  && apt update \
  && apt-get install -y nodejs \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
