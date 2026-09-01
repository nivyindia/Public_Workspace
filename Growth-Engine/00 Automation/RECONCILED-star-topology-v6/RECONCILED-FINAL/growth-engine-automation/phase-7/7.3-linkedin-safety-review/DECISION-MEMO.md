# 7.3.1 — LinkedIn Automation Safety Review

Master tracker khud (line 710) is step ko flag karta hai as **"audit/decision, code nahi"** — isliye koi workflow.json nahi hai, sirf ye memo.

## Current state
Module 2.1 (Multi-channel Outreach) mein LinkedIn leg already **intentionally semi-manual** hai — AI drafts karta hai, human sends karta hai. Ye decision already sahi hai.

## Recommendation: full-auto mat karo
LinkedIn ka ToS automated messaging/connection-requests explicitly restrict karta hai — bulk automation account ban ka real risk hai (khaas kar naya/kam-connection wala account). Semi-auto pattern (AI-draft + human-send) already ye risk avoid karta hai.

**Safe automation jo add ho sakti hai bina ban-risk ke:**
- Reply-check polling (Module 4.3.2 mein already scoped) — read-only, safe
- Draft-generation (already ho raha hai Module 2.1 mein)

**Risky, isliye NAHI recommend karta:**
- Auto-connection-requests
- Auto-messaging bina human click ke
- Scraping profile data at scale via unofficial API

## Verdict
Koi naya code nahi bana raha is step ke liye — jo semi-auto pattern already hai (Module 2.1 + Module 4.3.2), wahi final rakho. Agar tumhe kisi third-party LinkedIn automation tool (jaise PhantomBuster) ka specific use-case chahiye, wo alag risk-conversation hai, batao to discuss karte hain.
