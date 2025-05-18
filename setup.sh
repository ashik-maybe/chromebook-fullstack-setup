#!/usr/bin/env bash
set -euo pipefail

echo "[*] Starting Chromebook Fullstack Setup..."

scripts=(
  "01-base-packages.sh"
  "02-nodejs-setup.sh"
  "03-dotnet-sdk-setup.sh"
  "04-supabase-cli.sh"
  "05-yarn-pm2-nodemon.sh"
  "06-coolify-setup.sh"
  "07-performance-tweaks.sh"
  "08-devtools.sh"
)

for script in "${scripts[@]}"; do
  echo -e "\n[•] Running $script..."
  if bash "$script"; then
    echo "[✓] $script completed successfully."
  else
    echo "[✗] $script failed. Skipping and moving on..." >&2
  fi
done

echo -e "\n[✅] Chromebook Fullstack Setup Complete!"
