#!/bin/bash
set -euo pipefail

chmod 1777 /tmp || true

sudo apt-get update --fix-missing
sudo apt-get install -y cmake g++ python3

cmake -S . -B build -DCMAKE_BUILD_TYPE=Release
cmake --build build --config Release
cd build
cpack -G DEB

sudo mkdir -p /out && sudo chmod 777 /out
cp *.deb /out/
