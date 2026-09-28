#!/bin/bash
set -e
cd "$(dirname "$0")"

echo "=============================================="
echo " Friends Included — Mac setup"
echo "=============================================="
echo

if ! command -v node >/dev/null 2>&1; then
  echo "Node.js is not installed."
  echo "Install Node.js 20 LTS from https://nodejs.org and run this file again."
  exit 1
fi

echo "Node: $(node -v)"
echo "npm:  $(npm -v)"
echo
echo "Installing dependencies..."
npm install

echo
echo "Running production build..."
npm run build

echo
echo "=============================================="
echo "BUILD PASSED"
echo "The project is ready for GitHub/Vercel."
echo "Next: configure Supabase, Google Sheets and Telegram."
echo "=============================================="
read -n 1 -s -r -p "Press any key to close..."
echo
