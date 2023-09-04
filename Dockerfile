FROM python:3.11-slim-bullseye

ENV DEBIAN_FRONTEND noninteractive

ENV PIP_NO_CACHE_DIR on
ENV PIP_DISABLE_PIP_VERSION_CHECK on

ENV TZ Asia/Shanghai

ENV NVCHECKER_VERSION 2.12

# ENV APP_HOME /app/nvchecker
# WORKDIR ${APP_HOME}

RUN : \
    && set -ex \
    # install packages
    && apt-get update \
    && apt-get install -y --no-install-recommends curl tzdata libssl-dev libcurl4-openssl-dev build-essential jq grep unzip git ca-certificates \
    && update-ca-certificates \
    # set timezone
    && ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime && echo ${TZ} > /etc/timezone \
    # pip install
    && pip install --upgrade pip setuptools wheel \
    && pip install --upgrade yq lxml packaging \
    && pip install --upgrade nvchecker==${NVCHECKER_VERSION} \
    # && pip install --upgrade https://github.com/lilydjwg/nvchecker/archive/master.zip#egg=nvchecker \
    # https://github.com/mgdm/htmlq
    # install pup https://github.com/ericchiang/pup
    && curl -sOL `curl -s https://api.github.com/repos/ericchiang/pup/releases | grep browser_download_url | grep linux_amd64 | head -n 1 | cut -d '"' -f 4` && unzip -o pup_*.zip -d /usr/local/bin/ && rm -f pup_*.zip && chmod +x /usr/local/bin/pup \
    # cleac cache
    && apt-get clean autoclean \
    && rm -rf /var/cache/apk/* /tmp/* /var/tmp/* $HOME/.cache /var/lib/apt/lists/* /var/lib/{apt,dpkg,cache,log}/ \
    && :
