# Glance — App Store screenshots

Designed marketing screenshots for the App Store listing — **6.5″, 1284×2778**,
an App Store Connect-accepted iPhone size (it also covers smaller devices).
Charcoal + a single amber, matching the app and site (Bricolage Grotesque captions),
rendered from HTML via headless Chrome at deviceScaleFactor 3.

## Files
- `scene-1..4.html` + `shot.css` — the source scenes (authored at 428×926 logical)
- `png/01-home.png` — "One tap. Someone new." (the radar / get-matched home)
- `png/02-onboarding.png` — "Matched, not random." (a vivid onboarding question)
- `png/03-call.png` — "Say hi. Then tap Next." (the matched / connect moment)
- `png/04-safety.png` — "Verified. 18+. Never recorded." (trust)

## Re-render
`./render.sh` (requires Google Chrome). Edit the copy/screens in the HTML, re-run.
App Store Connect accepts **1242×2688** or **1284×2778** for this iPhone slot; this
set is 1284×2778. For 1242×2688, change `--window-size=428,926` → `414,896`.

## Notes
- Names/counts ("Maya, 21", "128 online") are illustrative placeholders.
- The call scene shows the connect / "say hi" beat with the partner's avatar — an
  honest stylization, not a fabricated live-video frame.
