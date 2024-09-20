#!/bin/bash

# Add the public key to authorized_keys if provided
if [ ! -z "$PUBLIC_KEY" ]; then
    echo "$PUBLIC_KEY" >> /root/.ssh/authorized_keys
    chmod 600 /root/.ssh/authorized_keys
fi

# Start SSH server
service ssh start

# Start dbus
service dbus start

# Run the VS Code tunnel service
exec code tunnel service install --accept-server-license-terms --disable-telemetry --name jax
