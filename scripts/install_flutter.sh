#!/bin/bash
set -e

echo "📦 Downloading Flutter SDK..."

FLUTTER_VERSION="3.22.3"

curl -L https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_${FLUTTER_VERSION}-stable.tar.xz -o flutter.tar.xz

tar xf flutter.tar.xz

# 👉 FIX: allow flutter git repo to run as root (CI environment)
git config --global --add safe.directory /vercel/path0/flutter

export PATH="$PATH:$(pwd)/flutter/bin"

flutter --version
