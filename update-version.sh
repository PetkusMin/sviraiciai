#!/bin/bash

# Get the short version of the latest Git commit hash
HASH=$(git rev-parse --short HEAD)

# Output the hash for verification
echo "Using Git hash: $HASH"

# Update the CSS reference (with or without existing ?v=) in index.html
sed -i '' -E "s|style\.css(\?v=[a-zA-Z0-9]*)?|styles.css?v=$HASH|" index.html

# Update the JS reference (with or without existing ?v=) in index.html
sed -i '' -E "s|script\.js(\?v=[a-zA-Z0-9]*)?|script.js?v=$HASH|" index.html

echo "✅ index.html updated with version ?v=$HASH for both CSS and JS"
