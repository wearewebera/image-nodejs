FROM webera/base

ENV PATH "/usr/local/sbin:/usr/sbin:/sbin:/usr/local/bin:/usr/bin:/bin"

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
     ca-certificates curl xz-utils openssl gnupg2 git nodejs npm \
  && npm cache clean -f \
  && npm install -g npm yarn \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
