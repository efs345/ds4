#!/bin/bash
set -e
cd "$(dirname "$0")"

echo "Checking required project structure..."
REQ=(
  "package.json"
  "schema.sql"
  "pages/index.tsx"
  "pages/api/index.ts"
  "pages/api/telegram.ts"
)

FAIL=0
for f in "${REQ[@]}"; do
  if [ -f "$f" ]; then
    echo "OK   $f"
  else
    echo "MISS $f"
    FAIL=1
  fi
done

echo
if [ "$FAIL" -eq 1 ]; then
  echo "STRUCTURE CHECK FAILED."
  exit 1
fi

echo "Structure is correct."
echo
echo "Checking for accidentally committed secrets..."
if grep -R --exclude-dir=node_modules --exclude-dir=.git -E "(TELEGRAM_BOT_TOKEN=.+|SUPABASE_SERVICE_ROLE_KEY=.+|GOOGLE_PRIVATE_KEY=.+)" . 2>/dev/null | grep -v ".env.example"; then
  echo
  echo "WARNING: possible secret found. Do not push real keys to GitHub."
else
  echo "No obvious hard-coded secrets found."
fi

echo
echo "If npm dependencies are installed, running build..."
if [ -d "node_modules" ]; then
  npm run build
else
  echo "node_modules not found. Run 1_SETUP_AND_TEST_MAC.command first."
fi
