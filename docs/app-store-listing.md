# Glance — App Store Connect listing kit

Draft copy + answers for the App Store submission, written to match the app and
the live site. Voice is the site's: dry, confident, nonchalant — not salesy.

> **Placeholders to settle before submitting:** the contact email (currently a
> dead `leonzhou@berkeley.edu` on the live site — swap for a real inbox), and the
> screenshots (you must provide). Everything else below is ready to paste.

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

Demo account (no real SIM needed): phone {{DEMO_PHONE}}, code {{DEMO_CODE}}.
Enter the phone, continue, enter the code. (Real numbers receive a code by SMS.)

Camera & microphone are used only for the live call; calls are peer-to-peer and
are NOT recorded or stored. Local network access is used to establish the most
reliable connection.

Safety (Guideline 1.2): every call has on-screen Report and Block. We act on
reports within 24h (warn / suspend / permanently ban); repeat-reported accounts
are auto-suspended. Because calls are live, moderation is reactive via this
report/block/ban system.

To see a matched call during review: {{REVIEW_CALL_PLAN — e.g. a teammate will be
online at <time/contact>, or use two devices with the demo account + a second test
number}}.

Privacy Policy: https://brendanjacobsen02.github.io/glance-site/privacy.html
Terms / EULA: https://brendanjacobsen02.github.io/glance-site/terms.html
Contact: leonzhou@berkeley.edu
```

## What's still needed from you (blocks submission, not this doc)
1. **Contact email** — a working inbox (swap the `leonzhou@berkeley.edu` placeholder
   on the site + the `leonzhou@berkeley.edu` above).
2. **`DEMO_LOGIN` Fly secret** — set `fly secrets set DEMO_LOGIN='+1...:CODE'` and
   put that phone/code in the review notes above (the reviewer bypass — already
   implemented in `server/sms.ts`).
3. **Screenshots** — 6.7" (iPhone 15/16 Pro Max) + 6.5"; optional iPad. Capture the
   onboarding, the "finding someone" home, and a call mock.
4. **The build** — `eas build -p ios --profile production` then `eas submit`
   (EAS already authed; the ASC app id is set, so submit is non-interactive).
5. **A reviewer-call plan** — decide how a solo reviewer sees a real matched call.
