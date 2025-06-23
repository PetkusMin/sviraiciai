#!/bin/bash

# Get the short Git commit hash
HASH=$(git rev-parse --short HEAD)

# Get current date and time
DATE=$(date +"%Y-%m-%d %H:%M:%S")

# Ask user for a comment
read -p "Enter a short comment for this deployment: " USER_COMMENT

# Show commit details
echo "----------------------------------"
echo "Deploying at: $DATE"
echo "Git hash: $HASH"
echo "Comment: $USER_COMMENT"
echo "----------------------------------"

# Update version in index.html (CSS and JS with cache busting)
sed -i '' -E "s|styles\.css(\?v=[a-zA-Z0-9]*)?|styles.css?v=$HASH|" index.html
sed -i '' -E "s|script\.js(\?v=[a-zA-Z0-9]*)?|script.js?v=$HASH|" index.html

# Stage all changes
git add .

# Commit changes
COMMIT_MSG="$DATE – $USER_COMMENT (v:$HASH)"
git commit -m "$COMMIT_MSG"

# Push to GitHub
git push origin main

# Log deployment
echo "$COMMIT_MSG" >> deploy.log

# Automatically open the GitHub Pages site (change to your actual URL!)
SITE_URL="https://petkusmin.github.io/sviraiciai/"
open "$SITE_URL"

echo "✅ Deployment complete and live at: $SITE_URL"
