# Glance — App Store screenshots

Designed marketing screenshots for the App Store listing — **6.7″, 1290×2796**.
Charcoal + a single amber, matching the app and site (Bricolage Grotesque captions),
rendered from HTML via headless Chrome at deviceScaleFactor 3.

## Files
- `scene-1..4.html` + `shot.css` — the source scenes
- `png/01-home.png` — "One tap. Someone new." (the radar / get-matched home)
- `png/02-onboarding.png` — "Matched, not random." (a vivid onboarding question)
- `png/03-call.png` — "Say hi. Then tap Next." (the matched / connect moment)
- `png/04-safety.png` — "Verified. 18+. Never recorded." (trust)

## Re-render
`./render.sh` (requires Google Chrome). Edit the copy/screens in the HTML and re-run.

## Notes
- **1290×2796 (6.7″) is the size App Store Connect requires**; it auto-scales for
  smaller iPhones, so this one set covers the iPhone requirement. (For a separate
  6.5″ set, the scene width would need to be parameterized — easy to add.)
- Names/counts ("Maya, 21", "128 online") are illustrative placeholders.
- The call scene shows the connect / "say hi" beat with the partner's avatar — an
  honest stylization, not a fabricated live-video frame.
