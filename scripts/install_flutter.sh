#!/bin/bash
set -e

echo "📦 Downloading Flutter SDK..."

FLUTTER_VERSION="3.22.3"

curl -L https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_${FLUTTER_VERSION}-stable.tar.xz -o flutter.tar.xz

tar xf flutter.tar.xz

export PATH="$PATH:$(pwd)/flutter/bin"

flutter --version
