#!/usr/bin/env bash
set -e

echo "Setting up assets (optional)…"
if git submodule update --init --recursive --depth 1; then
  echo "✅ Private assets installed."

  # Create the symlinks
  find ./assets -mindepth 1 -type d | while read -r src; do
    dst="./${src#./assets/}"
    src_abs="$(realpath "$src")"
    # Skip if dst already exists
    [ -e "$dst" ] && continue
    ln -s "$src_abs" "$dst" 2>/dev/null
  done

else
  echo "⚠️ Could not fetch private assets (no access)."
fi