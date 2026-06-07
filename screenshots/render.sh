#!/usr/bin/env bash
# Re-render the App Store screenshots (6.5", 1284x2778) from the HTML scenes.
# Requires Google Chrome. Output -> png/
# Accepted iPhone sizes: 1242x2688 or 1284x2778. This set is 1284x2778
# (428x926 logical @ deviceScaleFactor 3). For 1242x2688, use --window-size=414,896.
set -euo pipefail
CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
cd "$(dirname "$0")"
mkdir -p png
declare -A names=( [1]=01-home [2]=02-onboarding [3]=03-call [4]=04-safety )
for n in 1 2 3 4; do
  "$CHROME" --headless=new --hide-scrollbars --force-device-scale-factor=3 \
    --window-size=428,926 --virtual-time-budget=4000 \
    --screenshot="png/${names[$n]}.png" "file://$PWD/scene-${n}.html"
done
echo "rendered 4 screenshots to png/ (1284x2778)"
