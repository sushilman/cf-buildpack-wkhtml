#!/bin/bash
set -euo pipefail

echo "gem: --bindir /usr/bin" > ~/.gemrc
gem install wkhtmltoimage-binary
