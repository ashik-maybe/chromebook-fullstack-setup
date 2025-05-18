#!/bin/bash
# Install Supabase CLI for backend realtime & auth

set -e

echo "Installing Supabase CLI..."

# Using official Supabase install script
curl -fsSL https://supabase.com/install.sh | bash

echo "Adding Supabase CLI to PATH..."
export PATH="$HOME/.supabase/bin:$PATH"

echo "Supabase CLI version:"
supabase --version
