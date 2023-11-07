FROM webera/base

ENV PATH "/usr/local/sbin:/usr/sbin:/sbin:/usr/local/bin:/usr/bin:/bin"
ENV NODE_MAJOR 21

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
     ca-certificates curl openssl gnupg2 git \
  && mkdir -p /etc/apt/keyrings \
  && curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg \
  && echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list \
  && apt-get update \
  && apt-get install nodejs -y --no-install-recommends \
  && npm cache clean -f \
  && npm install -g npm yarn \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
