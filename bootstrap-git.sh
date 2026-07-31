#!/usr/bin/env bash
set -euo pipefail

git init
git add .
git commit -m "Initialize EENOS Product Delivery repository structure"

echo "Repository initialized locally."
echo "Create an empty GitHub repository, then run:"
echo "  git remote add origin <YOUR_GITHUB_REPOSITORY_URL>"
echo "  git branch -M main"
echo "  git push -u origin main"
