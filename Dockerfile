FROM python:3.8-slim-buster

ENV DEBIAN_FRONTEND noninteractive

ENV PIP_NO_CACHE_DIR on
ENV PIP_DISABLE_PIP_VERSION_CHECK on

ENV TZ Asia/Shanghai

ENV NVCHECKER_VERSION 1.6.post1

# ENV APP_HOME /app/nvchecker
# WORKDIR ${APP_HOME}

RUN set -ex \
    # install packages
    && apt-get update \
    && apt-get install -y --no-install-recommends curl tzdata libssl-dev libcurl4-openssl-dev build-essential jq \
    # set timezone
    && ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime && echo ${TZ} > /etc/timezone \
    # install nvchecker yq
    && pip install --no-cache-dir -U pip setuptools wheel \
    && pip install --no-cache-dir -U nvchecker==${NVCHECKER_VERSION} yq \
    # cleac cache
    && apt-get clean autoclean \
    && rm -rf /var/cache/apk/* /tmp/* /var/tmp/* $HOME/.cache /var/lib/apt/lists/* /var/lib/{apt,dpkg,cache,log}/
