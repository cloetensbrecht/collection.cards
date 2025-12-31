#!/usr/bin/env bash
set -e

# only run on Vercel
if [ "$VERCEL" != "1" ]; then
  echo "ℹ️  Not running on Vercel, skipping SSH setup"
  exit 0
fi

if [ -z "$SSH_PRIVATE_KEY" ]; then
  echo "❌ SSH_PRIVATE_KEY is not set"
  exit 1
fi

mkdir -p ~/.ssh
chmod 700 ~/.ssh

echo "$SSH_PRIVATE_KEY" > ~/.ssh/id_ed25519
chmod 600 ~/.ssh/id_ed25519

cat <<EOF > ~/.ssh/config
Host collection.cards
  HostName github.com
  IdentityFile ~/.ssh/id_ed25519
  StrictHostKeyChecking no
EOF

# Trust the Git host
ssh-keyscan github.com >> ~/.ssh/known_hosts
chmod 644 ~/.ssh/known_hosts

echo "✅ SSH configured for Vercel"