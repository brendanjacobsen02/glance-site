# Glance — App Store Connect listing kit

Draft copy + answers for the App Store submission, written to match the app and
the live site. Voice is the site's: dry, confident, nonchalant — not salesy.

> **Still needed before submitting:** set the `DEMO_LOGIN` reviewer-bypass secret
> (command in the checklist below) and provide screenshots. Contact email is set
> (`leonzhou@berkeley.edu`, live on the site). Everything else below is paste-ready.

## URLs (live now)
- **Privacy Policy URL:** https://brendanjacobsen02.github.io/glance-site/privacy.html
- **Marketing / Support URL:** https://brendanjacobsen02.github.io/glance-site/
- **EULA:** https://brendanjacobsen02.github.io/glance-site/terms.html
  (paste into the *custom EULA* field, or use Apple's standard EULA + this as your terms)

## Name & text fields
- **App Name** (≤30): `Glance`
  - If taken on the App Store, fall back to `Glance: Campus Video Chat`.
- **Subtitle** (≤30): `Random campus video chat`
- **Promotional Text** (≤170): `Tap to meet someone new, tap Next when you're done. Verified 18+, calls are never recorded. Coming to campuses now.`
- **Keywords** (≤100, comma-separated, no spaces wasted):
  `video chat,random,meet,campus,college,students,strangers,talk,live,social,friends,nearby`

### Description
```
Talk to someone new. Then someone else.

Glance is random video chat for your campus. Tap once, get matched with another
person who's online right now, and talk over live video. Tap Next when you're
ready to move on. That's the whole app.

Real people, 18+. Every account is verified by a real phone number, with a quick
face check to keep bots and fakes out.

Not recorded. Your video and audio go straight phone-to-phone — our server makes
the introduction and never sees your call.

Matched, not shuffled. A light read on your interests and vibe nudges you toward
people you'd actually want to talk to, instead of pure roulette.

Easy to leave. Report and block live in the call. Bad actors are auto-removed and
reviewed by a human.

Glance is for adults 18 and over. By using it you agree to our Terms and zero
tolerance for objectionable behavior.
```

## Age rating
Answer the questionnaire honestly → expect **17+**:
- **Unrestricted Web Access:** No.
- **User-Generated Content / live user-to-user:** Yes — and this is the key one:
  random live video with strangers. Declare it; Apple maps it to 17+ and expects
  the Guideline 1.2 safeguards (which we have: report, block, auto-ban, human
  review, 18+ gate).
- Mature/Suggestive themes: select "Infrequent/Mild" honestly; the *app* doesn't
  contain such content, but unmoderated live video can surface it — the UGC answer
  above is what drives the rating.

## App Privacy ("nutrition label")
Declare these data types (all **linked to the user**, **app functionality only**,
**NOT used for tracking**, **not sold/shared for ads** — we run no ad/analytics SDKs):

| Data | Collected? | Purpose | Notes |
|---|---|---|---|
| Phone number | Yes | App Functionality (auth) | verified via Twilio |
| Name, username, profile (bio, avatar, birthday) | Yes | App Functionality | |
| Other user content (free-text onboarding answer) | Yes | App Functionality (matching) | sent to Anthropic for trait inference |
| Product interaction / usage (call outcomes, durations) | Yes | App Functionality (improve matching) | metadata, not content |
| User content — safety reports | Yes | App Functionality (safety) | |
| **Camera / Microphone (live video & audio)** | **Not collected** | — | peer-to-peer, **never recorded or stored** |
| Coarse IP (rate-limiting) | Not collected/stored | Security | transient, in-memory only |

Third-party processors (service providers, not data brokers): **Twilio** (SMS),
**Anthropic** (trait inference), **Fly.io** (hosting), **metered.ca** (TURN relay —
relays encrypted media, stores nothing).

## App Review notes (paste into "Notes")
```
Glance is 1-to-1 random video chat for adults (18+). Sign-in is by phone + SMS code.

Demo account (no real SIM needed): phone +1 510 555 0142, code 421337.
Enter the phone, continue, enter the code. (Real numbers receive a code by SMS.)

Camera & microphone are used only for the live call; calls are peer-to-peer and
are NOT recorded or stored. Local network access is used to establish the most
reliable connection.

Safety (Guideline 1.2): every call has on-screen Report and Block. We act on
reports within 24h (warn / suspend / permanently ban); repeat-reported accounts
are auto-suspended. Because calls are live, moderation is reactive via this
report/block/ban system.

To see a matched call during review: a tester will be online and waiting to be
matched during your review window — email leonzhou@berkeley.edu to coordinate a
time. Alternatively, sign in on two devices (the demo account above + any real
phone number, which receives its code by SMS) to match them with each other.

Privacy Policy: https://brendanjacobsen02.github.io/glance-site/privacy.html
Terms / EULA: https://brendanjacobsen02.github.io/glance-site/terms.html
Contact: leonzhou@berkeley.edu
```

## What's still needed from you (blocks submission, not this doc)
1. ~~**Contact email**~~ — ✅ done (`leonzhou@berkeley.edu`, live on the site + in the notes).
2. **`DEMO_LOGIN` Fly secret** — run (an agent can't set a prod auth-bypass secret):
   ```
   fly secrets set DEMO_LOGIN='+15105550142:421337' -a glance-server
   ```
   This matches the demo phone/code in the review notes; the bypass is implemented
   in `server/sms.ts`. Change the value if you prefer a different demo phone/code
   (keep the notes in sync).
3. **Screenshots** — 6.7" (iPhone 15/16 Pro Max, 1290×2796) + 6.5"; optional iPad.
   Capture onboarding, the "finding someone" home, and a call. *(See "What screenshots
   are" — these are the marketing images on your product page, not a functional step.)*
4. ~~**The build**~~ — ⏳ a production build is running on EAS; `eas submit` once it's done.
5. **Reviewer-call plan** — ✅ drafted in the notes (tester-on-call or two-device); confirm which.
