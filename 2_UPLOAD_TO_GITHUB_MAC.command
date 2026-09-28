#!/bin/bash
set -e
cd "$(dirname "$0")"

echo "=============================================="
echo " Friends Included — GitHub upload"
echo "=============================================="
echo
read -p "Paste your GitHub repository URL (example: https://github.com/USER/REPO.git): " REPO

if [ -z "$REPO" ]; then
  echo "No repository URL entered."
  exit 1
fi

if [ ! -d ".git" ]; then
  git init
fi

git branch -M main
git add .
git commit -m "Final Friends Included Day 4 submission" || true

if git remote get-url origin >/dev/null 2>&1; then
  git remote set-url origin "$REPO"
else
  git remote add origin "$REPO"
fi

echo
echo "Pushing project..."
git push -u origin main --force

echo
echo "=============================================="
echo "UPLOAD COMPLETE"
echo "Open Vercel and import this repository."
echo "=============================================="
read -n 1 -s -r -p "Press any key to close..."
echo
