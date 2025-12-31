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

echo "✅ SSH configured for Vercel"