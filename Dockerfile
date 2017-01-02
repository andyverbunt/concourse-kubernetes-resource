FROM gliderlabs/alpine:3.4

RUN apk --update add \
  ca-certificates \
  bash \
  jq \
  git \
  curl

# can't `git pull` unless we set these
RUN git config --global user.email "git@localhost" && \
    git config --global user.name "git"

RUN curl -O https://storage.googleapis.com/kubernetes-release/release/v1.5.1/bin/linux/amd64/kubectl && chmod +x kubectl && mv kubectl /usr/local/bin/kubectl

ADD assets/ /opt/resource/
RUN chmod +x /opt/resource/*
