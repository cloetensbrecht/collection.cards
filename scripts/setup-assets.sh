#!/usr/bin/env bash
set -e

ASSETS_DIR="assets"
PRIVATE_ASSETS_URL="git@collection.cards:collection-cards/private-assets.collection.cards.git"
VERCEL_ASSETS_URL="git@github.coms:collection-cards/private-assets.collection.cards.git"
PUBLIC_ASSETS_URL="git@github.com:collection-cards/assets.collection.cards.git"

has_private_access() {
  if [ "$VERCEL" != "1" ]; then
    GIT_SSH_COMMAND="ssh -o BatchMode=yes -o ConnectTimeout=2"
  fi
  git ls-remote --heads "$PRIVATE_ASSETS_URL" &>/dev/null
}

echo "Setting up $ASSETS_DIR…"

# Determine desired repo
if has_private_access; then
  if [ "$VERCEL" != "1" ]; then
    DESIRED_URL="$PRIVATE_ASSETS_URL"
  else
    DESIRED_URL="$VERCEL_ASSETS_URL"
  fi
  echo "✅ Using private assets"
else
  DESIRED_URL="$PUBLIC_ASSETS_URL"
  echo "⚠️ Using public assets"
fi

# Check current repo URL (if directory exists)
if [ -d "$ASSETS_DIR" ]; then
  CURRENT_URL=$(git -C "$ASSETS_DIR" remote get-url origin 2>/dev/null || echo "")
else
  CURRENT_URL=""
fi

# If directory does not exist or repo URL differs → clone fresh
if [ "$CURRENT_URL" != "$DESIRED_URL" ]; then
  echo "🔄 Assets repo mismatch or missing. Resetting $ASSETS_DIR…"
  rm -rf "$ASSETS_DIR"

  git clone --depth 1 "$DESIRED_URL" "$ASSETS_DIR"

  # Switch back to the public repo to prevent assets from pointing to the private hash
  if has_private_access; then
    git submodule set-url "$ASSETS_DIR" "$PUBLIC_ASSETS_URL"
  fi
else
  echo "✅ $ASSETS_DIR already up-to-date, skipping fetch"
fi

# Create symlinks to the assets directories
find ./assets -mindepth 1 -type d | while read -r src; do
  dst="./${src#./assets/}"
  src_abs="$(realpath "$src")"
  [ -e "$dst" ] && continue
  ln -s "$src_abs" "$dst" 2>/dev/null || true
done

echo "✅ Assets setup complete"