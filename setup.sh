#!/bin/bash

echo "Starting installation..."

# Find every package.json in the current directory (and subdirectories)
find . -type f -name "package.json" | while read pkg; do
  dir=$(dirname "$pkg")
  echo ""
  echo "→ Installing dependencies in directory: $dir"
  cd "$dir" || { echo "Failed to cd into $dir"; exit 1; }
  npm install
  cd - > /dev/null
done

echo ""
echo "✅ All ‘npm install’ commands completed."