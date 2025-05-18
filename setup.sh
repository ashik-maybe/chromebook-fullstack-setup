#!/bin/bash
# Master script to run all setup scripts sequentially

set -e

SCRIPTS=(
  "01-base-packages.sh"
  "02-nodejs-setup.sh"
  "03-dotnet-sdk-setup.sh"
  "04-supabase-cli.sh"
  "05-yarn-pm2-nodemon.sh"
  "06-coolify-setup.sh"
  "07-performance-tweaks.sh"
  "bash 08-devtools.sh"
)

for script in "${SCRIPTS[@]}"; do
  echo "Running $script..."
  bash "$script"
  echo "$script completed."
done

echo "All setup scripts executed successfully!"
