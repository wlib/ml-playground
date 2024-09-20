FROM ghcr.io/nvidia/jax:jax

RUN curl -sL "https://code.visualstudio.com/sha/download?build=stable&os=cli-alpine-x64" --output /tmp/vscode-cli.tar.gz && \
  tar -xf /tmp/vscode-cli.tar.gz -C /usr/bin && \
  rm /tmp/vscode-cli.tar.gz

WORKDIR /home/workspace

ENTRYPOINT [ "code tunnel service install --accept-server-license-terms --disable-telemetry --name jax" ]
