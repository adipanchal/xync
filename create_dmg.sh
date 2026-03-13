#!/bin/bash

# Ensure create-dmg is installed
if ! command -v create-dmg &> /dev/null
then
    echo "❌ create-dmg could not be found."
    echo "Installing create-dmg via Homebrew..."
    brew install create-dmg
fi

# Check if Xync.app exists in the current directory
if [ ! -d "Xync.app" ]; then
    echo "❌ Error: Xync.app not found in the current directory!"
    echo "Please export your archived app from Xcode (Custom -> Copy App) and place 'Xync.app' next to this script."
    exit 1
fi

echo "📦 Removing old DMG if it exists..."
rm -f Xync.dmg

echo "🎨 Creating beautiful Xync.dmg..."
create-dmg \
  --volname "Xync Installer" \
  --window-pos 200 120 \
  --window-size 600 400 \
  --icon-size 100 \
  --icon "Xync.app" 150 190 \
  --hide-extension "Xync.app" \
  --app-drop-link 450 190 \
  "Xync.dmg" \
  "Xync.app/"

echo "✅ Done! Xync.dmg is ready for distribution."
