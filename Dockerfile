FROM ghcr.io/nvidia/jax:jax

RUN apt-get update && apt-get install -y dbus openssh-server && apt-get clean

# Install VS Code
RUN curl -sL "https://code.visualstudio.com/sha/download?build=stable&os=cli-alpine-x64" --output /tmp/vscode-cli.tar.gz && \
  tar -xf /tmp/vscode-cli.tar.gz -C /usr/bin && \
  rm /tmp/vscode-cli.tar.gz

# Set up SSH
RUN mkdir /var/run/sshd
COPY sshd_config /etc/ssh/sshd_config
RUN mkdir -p /root/.ssh && \
  touch /root/.ssh/authorized_keys && \
  chmod 700 /root/.ssh && \
  chmod 600 /root/.ssh/authorized_keys

WORKDIR /home/workspace

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
