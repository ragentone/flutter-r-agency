#!/bin/bash
flutter build macos
create-dmg \
  --volname "r-agency" \
  --volicon "app_icon.png" \
  --window-pos 200 120 \
  --window-size 600 400 \
  --icon-size 100 \
  --icon "app.app" 175 190 \
  --app-drop-link 425 190 \
  "/Volumes/Dev/r-agency.dmg" \
  "build/macos/Build/Products/Release/app.app"