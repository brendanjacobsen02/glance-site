#!/usr/bin/env bash
# Re-render the App Store screenshots (6.7", 1290x2796) from the HTML scenes.
# Requires Google Chrome. Output -> png/
set -euo pipefail
CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
cd "$(dirname "$0")"
mkdir -p png
declare -A names=( [1]=01-home [2]=02-onboarding [3]=03-call [4]=04-safety )
for n in 1 2 3 4; do
  "$CHROME" --headless=new --hide-scrollbars --force-device-scale-factor=3 \
    --window-size=430,932 --virtual-time-budget=4000 \
    --screenshot="png/${names[$n]}.png" "file://$PWD/scene-${n}.html"
done
echo "rendered 4 screenshots to png/ (1290x2796)"
