#!/bin/bash

# Get short Git commit hash
HASH=$(git rev-parse --short HEAD)

# Get current date and time in YYYY-MM-DD HH:MM format
DATE=$(date +"%Y-%m-%d %H:%M")

# Ask user for a custom comment
read -p "Enter a short comment for this deployment: " USER_COMMENT

# Show what will be committed
echo "Using commit hash: $HASH"
echo "Date: $DATE"
echo "Comment: $USER_COMMENT"

# Update version in index.html for CSS and JS
sed -i '' -E "s|styles\.css(\?v=[a-zA-Z0-9]*)?|styles.css?v=$HASH|" index.html
sed -i '' -E "s|script\.js(\?v=[a-zA-Z0-9]*)?|script.js?v=$HASH|" index.html

# Stage all changes
git add .

# Create commit with combined message
git commit -m "$DATE – $USER_COMMENT (v:$HASH)"

# Push to GitHub
git push origin main

echo "✅ Deployed: $DATE – $USER_COMMENT (v:$HASH)"
