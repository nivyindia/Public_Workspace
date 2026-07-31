# 🤖 Nivy Digital — Complete Sales Automation via Enquiry Method

# 🤖 Nivy Digital — Complete Sales Automation via Enquiry Method

> **What this page is:** A step-by-step guide to building a fully automated sales machine using enquiry-based marketing. Written for beginners. Every process is broken down so a fresher can follow and execute.
> 

> **Core Idea:** Instead of cold-pitching strangers, you post enquiries ("Looking for X", "Seeking Y partners") that attract interested people to YOU. Then automation handles everything: capturing, qualifying, following up, and routing to your team.
> 

---

## 📖 HOW TO READ THIS PAGE

This page is split into two sections:

**Section A — The Universal Process**

The core flow that applies to ALL enquiry methods (posting, email, contact forms, WhatsApp, etc.)

**Section B — Platform-Specific Processes**

Separate guides for each platform where the steps are different.

---

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

# SECTION A — THE UNIVERSAL ENQUIRY PROCESS

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

## 🧠 WHAT IS THE ENQUIRY METHOD?

Instead of saying: *"We offer digital marketing services, interested?"*

You say: *"Looking for digital agencies in UK open to white-label partnerships"*

The difference:

- First approach = cold pitch = ignored
- Second approach = opportunity post = people self-qualify and reach out to YOU

This works on every platform. The automation flow below captures and handles every person who responds.

---

## 🔄 THE UNIVERSAL 8-STEP FLOW

This process is the same regardless of platform:

```
STEP 1: AI GENERATES ENQUIRY CONTENT
           ↓
STEP 2: POST / SEND THE ENQUIRY
           ↓
STEP 3: MONITOR FOR RESPONSES
           ↓
STEP 4: CAPTURE LEAD DATA
           ↓
STEP 5: AI QUALIFIES THE LEAD
           ↓
STEP 6: AUTOMATED FOLLOW-UP SEQUENCE
           ↓
STEP 7: HOT LEAD → HUMAN CLOSER NOTIFIED
           ↓
STEP 8: CRM UPDATED + RELATIONSHIP SAVED
```

---

## ⚙️ STEP 1 — AI CONTENT GENERATION

**What happens:** n8n calls OpenAI every day to generate fresh enquiry posts.

**n8n nodes used:**

- Schedule Trigger (runs daily at 8am)
- HTTP Request node → OpenAI API
- Set node → stores generated content
- Google Sheets node → saves to content calendar

**Prompt template for OpenAI:**

```
You are a B2B marketing expert for Nivy Digital.
Generate 5 enquiry-style posts for today.
Each post should follow this format:
- "Looking for [type of business] in [location]"
- Max 150 words
- Professional but conversational tone
- End with a soft CTA: DM, comment, or WhatsApp

Today's targets: {{country}}, {{industry}}, {{service}}
Output: JSON array with 5 posts. No extra text.
```

**Output stored in Google Sheets:**

| Post | Platform | Country | Industry | Status | Posted Date |
| --- | --- | --- | --- | --- | --- |
| Looking for... | LinkedIn | UK | Accounting | Pending | - |

---

## ⚙️ STEP 2 — POST / SEND THE ENQUIRY

This step differs per platform. See Section B for each platform's specific automation.

**Common tools used:**

- Buffer API / Publer API (social posting)
- Mautic (email sending)
- Playwright / Browserless (form filling)
- WhatsApp Business API (WhatsApp)

---

## ⚙️ STEP 3 — MONITOR FOR RESPONSES

**What happens:** n8n watches for any response (comment, DM, email reply, form submission, WhatsApp message).

**How monitoring works per platform:**

| Platform | Monitoring Method |
| --- | --- |
| LinkedIn | PhantomBuster export → n8n reads CSV |
| Facebook | Facebook Graph API webhook |
| Email | Mautic reply tracking webhook |
| WhatsApp | WhatsApp Business API webhook |
| Contact Forms | Website webhook → n8n |
| Instagram | Instagram Graph API |
| Twitter/X | Twitter API stream |

**n8n nodes used:**

- Webhook node (receives real-time responses)
- Schedule Trigger (polls for responses every 2 hours)
- HTTP Request (calls platform APIs)

---

## ⚙️ STEP 4 — CAPTURE LEAD DATA

**What happens:** Every response gets captured and standardized.

**Data captured:**

- Name
- Platform they responded on
- Their message / comment text
- Profile URL or contact info
- Timestamp
- Which enquiry post they responded to

**n8n nodes used:**

- Set node (standardize data format)
- IF node (check if lead already exists → deduplication)
- Google Sheets node (write new lead to Master CRM sheet)

**Deduplication check:**

```
IF email OR phone already exists in sheet
→ Update existing row (add new interaction)
ELSE
→ Create new row
```

---

## ⚙️ STEP 5 — AI LEAD QUALIFICATION

**What happens:** OpenAI reads the lead's response and classifies them.

**n8n nodes used:**

- HTTP Request node → OpenAI API
- Switch node (routes based on classification)

**Qualification prompt:**

```
A person responded to our enquiry post with this message:
"{{lead_message}}"

Their profile: {{profile_info}}
Their industry: {{industry}}

Classify this lead:
1. HOT - Actively interested, needs our service now
2. WARM - Interested but not urgent
3. COLD - Just curious, low fit
4. PARTNER - Could be a referral partner or vendor
5. SPAM - Irrelevant

Also extract:
- Their main pain point (1 sentence)
- Best service to offer them
- Suggested next step

Output JSON only.
```

**Routing after classification:**

```
HOT  → Notify team on WhatsApp immediately + fast-track sequence
WARM → Enter 7-day nurture email sequence
COLD → Enter 30-day long-term newsletter sequence
PARTNER → Move to Partner CRM tab + separate sequence
SPAM → Archive, do not contact
```

---

## ⚙️ STEP 6 — AUTOMATED FOLLOW-UP SEQUENCE

**What happens:** Based on classification, the lead enters an automated sequence.

**HOT Lead Sequence (3 days):**

```
Day 0 (immediate): "Thanks for your interest. Here's how we help [industry]"
Day 1: Send relevant case study or result
Day 2: "Would a quick 20-min call make sense? Book here: [cal.com link]"
Day 3: If no reply → "Should I close your file or would next week work?"
```

**WARM Lead Sequence (14 days):**

```
Day 0: Welcome + value resource (PDF/guide)
Day 3: Educational content relevant to their industry
Day 7: Client result/case study
Day 10: Free audit offer
Day 14: Call CTA
```

**COLD Lead Sequence (monthly):**

```
Week 1: Added to newsletter
Month 1: Industry insight email
Month 2: New service announcement
Month 3: "Still relevant?" re-engagement email
```

**Tools used:**

- Mautic (email sequences with full tracking)
- n8n (sequence trigger logic)
- WhatsApp Business API (WhatsApp messages for hot leads)
- [Cal.com](http://Cal.com) (booking links embedded in messages)

---

## ⚙️ STEP 7 — HOT LEAD → HUMAN CLOSER

**What happens:** When a lead books a call or shows strong intent, a human takes over.

**Trigger conditions:**

- Lead clicks booking link
- Lead replies "yes" / "interested" / "let's talk"
- Lead score exceeds 12 points
- Lead requests pricing

**n8n notification flow:**

```
[Hot signal detected]
        ↓
[n8n sends WhatsApp message to sales person]
"🔥 HOT LEAD: [Name] from [Company], [Country]
Service interest: [Service]
Their message: [Quote]
CRM link: [Google Sheets link]
Cal.com booking: [Link]"
        ↓
[Log in CRM: status = Hot, assigned to = [VA name]]
        ↓
[Pause automated sequence — human takes over]
```

---

## ⚙️ STEP 8 — CRM UPDATE + RELATIONSHIP SAVED

**What happens:** Every interaction is logged. No lead ever gets lost.

**CRM columns updated after each action:**

- Last Activity Date
- Stage (Cold → Warm → Hot → Call → Proposal → Client)
- All messages logged in Notes column
- Next Action + Next Action Date
- Assigned Team Member

**n8n Weekly Cleanup Flow:**

```
[Every Monday 8am]
        ↓
[Read all leads where "Next Action Date" = today or past]
        ↓
[Send reminder to assigned VA]
        ↓
[Leads with no activity in 30 days → flag for re-engagement]
```

---

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

# SECTION B — PLATFORM-SPECIFIC PROCESSES

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

---

## 📘 PLATFORM 1 — LINKEDIN (Posts + Groups + DMs)

### What's Different Here:

LinkedIn has strict anti-automation rules. Automation must mimic human behavior with delays and limits.

### Step-by-Step Automation:

**Posting:**

1. n8n generates post via OpenAI
2. n8n calls Buffer API → schedules LinkedIn post
3. Buffer posts at optimal time (8–10am weekdays)
4. n8n logs post URL in Google Sheets

**Group Posting:**

1. PhantomBuster "LinkedIn Group Auto Post" phantom
2. Feed it: list of group URLs + post content from Google Sheets
3. Set delays: 10–15 min between posts, max 5 groups/day
4. PhantomBuster exports results → n8n reads → logs in sheet

**Monitoring Comments:**

1. PhantomBuster "LinkedIn Post Commenters Scraper"
2. Runs every 6 hours on your recent posts
3. Exports new commenters CSV → n8n reads
4. n8n: new commenter → capture → qualify (Step 4–5)

**Monitoring DMs:**

1. Manual check by VA (LinkedIn DMs can't be API-accessed reliably)
2. VA logs new DMs in Google Sheets
3. n8n detects new row → triggers qualification + follow-up

**Safety Rules:**

- Max 20 connection requests/day
- Max 5 group posts/day
- Always use human-like delays (5–15 min)
- Never automate on weekends
- Use secondary LinkedIn account for automation activity

**Tools:** Buffer, PhantomBuster, n8n, OpenAI

---

## 📘 PLATFORM 2 — FACEBOOK (Personal + Groups + Pages)

### What's Different Here:

Facebook Graph API allows page posting but group posting requires browser automation.

### Step-by-Step Automation:

**Page Posting:**

1. n8n generates post content
2. n8n calls Facebook Graph API
3. POST to `/{page-id}/feed` with message + access token
4. Log post ID in Google Sheets

**Group Posting (Browser Automation):**

1. Apify "Facebook Group Poster" actor OR Playwright script
2. Input: list of group URLs + post content
3. Apify logs into Facebook (using stored cookies)
4. Posts with random delay (15–30 min between groups)
5. Max 5–8 groups/day per account

**Monitoring Comments on Page Posts:**

1. Facebook Webhook → n8n (set up in Meta Developer Console)
2. When someone comments → webhook fires → n8n receives data
3. Extract: commenter name, comment text, profile
4. Push to capture flow (Step 4)

**Monitoring Group Post Responses:**

1. PhantomBuster "Facebook Group Scraper" (checks your posts)
2. Runs every 12 hours
3. New comments → n8n → capture + qualify

**Tools:** Facebook Graph API, Apify, Playwright, PhantomBuster, n8n

---

## 📘 PLATFORM 3 — INSTAGRAM (Posts + DMs)

### What's Different Here:

Instagram is owned by Meta. Graph API works for business accounts. Direct posting is allowed via API.

### Step-by-Step Automation:

**Posting:**

1. n8n generates caption via OpenAI
2. Image created via Canva template or AI image tool
3. n8n calls Instagram Graph API → schedules post via Buffer
4. Post goes live at optimal time (9–11am, 6–8pm)

**Comment Monitoring:**

1. Instagram Business webhook → n8n
2. New comment on post → webhook fires
3. n8n receives: username, comment text, post ID
4. If comment contains keyword ("interested", "how", "details") → trigger DM

**Auto-DM on Keyword Comment:**

```
n8n detects keyword comment
        ↓
Instagram Graph API → send DM to commenter
Message: "Hey [name], thanks for your comment!
Here's the resource you asked about: [link]
Would love to connect — what's your business?"
        ↓
Log commenter in CRM
        ↓
Start qualification flow
```

**Safety Rules:**

- Max 50 DMs/day
- Never send same DM template twice in a row
- Add personalization: use their name + reference their comment
- Don't DM people who didn't engage first

**Tools:** Instagram Graph API, Buffer, n8n, OpenAI

---

## 📘 PLATFORM 4 — CONTACT FORM OUTREACH

### What's Different Here:

This is outbound via website contact forms. You find businesses, visit their site, and submit a personalized enquiry through their contact form.

### Step-by-Step Automation:

**Step 1 — Scrape Target Websites:**

1. Apify "Website Contact Form Scraper" actor
2. Input: list of company websites (from lead database)
3. Output: form URLs, field names (name, email, message, etc.)
4. Store in Google Sheets: Company | Website | Form URL | Fields Found

**Step 2 — AI Personalizes Message:**

```
n8n reads company name + industry from sheet
        ↓
Calls OpenAI:
"Write a contact form message for [Company] in [Industry].
We offer [service]. Keep it under 100 words.
Tone: consultative, not salesy.
Mention something specific about their business."
        ↓
Stores generated message in sheet
```

**Step 3 — Browser Automation Fills Form:**

```
n8n triggers Playwright script via HTTP Request to Browserless
Playwright:
1. Opens company website contact form URL
2. Fills name field: "Nivy Digital Team"
3. Fills email field: [your email]
4. Fills message field: [AI-generated message]
5. Clicks submit
6. Captures: success/error status
        ↓
n8n logs result in sheet: Submitted ✓ / Failed ✗
```

**Playwright Code (runs on Browserless):**

```jsx
const { chromium } = require('playwright');
async function fillContactForm(url, name, email, message) {
  const browser = await chromium.connectOverCDP('wss://chrome.browserless.io?token=YOUR_TOKEN');
  const page = await browser.newPage();
  await page.goto(url, { waitUntil: 'networkidle' });
  
  // Fill common form fields
  const nameSelectors = ['input[name="name"]', 'input[id="name"]', 'input[placeholder*="name" i]'];
  const emailSelectors = ['input[name="email"]', 'input[type="email"]'];
  const messageSelectors = ['textarea[name="message"]', 'textarea[id="message"]'];
  
  for (const sel of nameSelectors) {
    if (await page.$(sel)) { await page.fill(sel, name); break; }
  }
  for (const sel of emailSelectors) {
    if (await page.$(sel)) { await page.fill(sel, email); break; }
  }
  for (const sel of messageSelectors) {
    if (await page.$(sel)) { await page.fill(sel, message); break; }
  }
  
  // Random delay before submit (human-like)
  await page.waitForTimeout(Math.random() * 3000 + 2000);
  await page.click('button[type="submit"], input[type="submit"]');
  await page.waitForTimeout(2000);
  await browser.close();
  return 'submitted';
}
```

**Step 4 — Monitor Replies:**

1. All form submissions use your domain email
2. Gmail API or IMAP → n8n polls inbox every 2 hours
3. New reply detected → extract sender + message
4. Push to qualification flow (Step 5 universal)

**Safety Rules:**

- Max 20 form submissions/day
- Vary message templates (min 5 variants)
- Never submit same company twice
- Check for GDPR opt-out indicators on form

**Tools:** Apify, Playwright, Browserless, n8n, OpenAI, Gmail API

---

## 📘 PLATFORM 5 — EMAIL OUTREACH

### What's Different Here:

Email has the most mature automation. Fully automatable with sequences, tracking, and reply detection.

### Step-by-Step Automation:

**Step 1 — Lead Scraping + Email Finding:**

```
n8n Schedule Trigger (daily)
        ↓
Apollo API → fetch leads by ICP
(industry, country, role, company size)
        ↓
Hunter API → verify emails
        ↓
Reoon/NeverBounce API → validate
  Valid → keep
  Risky → flag
  Invalid → discard
        ↓
Store in Google Sheets: Ready to Email tab
```

**Step 2 — AI Email Generation:**

```
n8n reads lead data from sheet
        ↓
OpenAI generates:
- Subject line (A/B: 2 variants)
- Email body (personalized, 100-120 words)
- Follow-up email 1 (different angle)
- Follow-up email 2 (breakup email)
        ↓
Store all 3 in sheet columns
```

**Step 3 — Mautic Sequence Launch:**

```
n8n HTTP Request → Mautic API
1. Create contact in Mautic
2. Add to segment: "[Country] [Industry] Outreach [Month]"
3. Start campaign:
   - Email 1: Day 0
   - Email 2: Day 5
   - Email 3: Day 12
        ↓
Log in Google Sheets: Mautic campaign started ✓
```

**Step 4 — Reply Detection:**

```
Mautic reply webhook → n8n
        ↓
Extract: sender email, reply text
        ↓
OpenAI classifies reply:
  Positive → HOT sequence
  Not now → WARM sequence
  Unsubscribe → Remove from all lists
  Spam complaint → Blacklist immediately
        ↓
Update CRM row status
        ↓
If Positive → alert team on WhatsApp
```

**Email Sending Rules:**

- Max 30–50 emails/day per inbox in first 60 days
- Use secondary domain (never primary business domain)
- Warm up domain 3 weeks before first send
- Always include: unsubscribe link, company name, physical address
- Send Mon–Thu, 8–11am local time of recipient country
- Never resend to unsubscribes

**Tools:** Apollo, Hunter, Reoon, Mautic, n8n, OpenAI, Gmail API

---

## 📘 PLATFORM 6 — WHATSAPP OUTREACH & NURTURE

### What's Different Here:

WhatsApp is semi-automated only. Meta policies are strict. Human touch is essential. Best used for nurture and response, not cold outreach.

### Step-by-Step Automation:

**Inbound (someone messages you first):**

```
WhatsApp Business API webhook → n8n
        ↓
Detect: first message or keyword
        ↓
Send: automated welcome message + menu

"Hi [Name]! 👋 Thanks for reaching out to Nivy Digital.
What can I help you with?

Reply with:
1️⃣ Our Services
2️⃣ Free Audit
3️⃣ Book a Call
4️⃣ Pricing
5️⃣ Talk to Team"
        ↓
Based on reply number:
  1 → Send services PDF
  2 → Send Tally audit form link
  3 → Send Cal.com link
  4 → Send pricing overview
  5 → Flag for VA + notify team
        ↓
Add contact to CRM: source = WhatsApp
        ↓
Start nurture sequence (7-day status content loop)
```

**Outbound (follow up with warm contacts):**

- ONLY contact people who have saved your number or interacted before
- Use WhatsApp Business broadcast (not bulk API)
- Max 50 messages/day to non-template contacts
- Always give easy opt-out option

**Status Content Automation:**

```
[n8n: daily 7am]
        ↓
[Read today's WhatsApp status content from Google Sheets]
        ↓
[Send reminder to VA: "Post this status today"]
[Content: pre-written 5-day loop from content calendar]
        ↓
[VA posts manually — cannot be auto-posted]
        ↓
[Log: posted ✓ in sheet]
```

**Tools:** WhatsApp Business API (Meta), WATI (optional), n8n, [Cal.com](http://Cal.com)

---

## 📘 PLATFORM 7 — TWITTER/X ENQUIRY POSTS

### What's Different Here:

Twitter/X API allows posting and monitoring. Good for tech, SaaS, and startup audiences.

### Step-by-Step Automation:

**Posting:**

1. n8n generates tweet-length enquiry (max 280 chars)
2. n8n calls Twitter API v2 → posts tweet
3. Tag relevant hashtags: #StartupUK #B2B #Outsourcing
4. Log tweet ID in Google Sheets

**Monitoring Mentions + Replies:**

1. Twitter API v2 stream → n8n webhook
2. New reply/mention detected
3. Extract: username, reply text, profile
4. Push to qualification flow

**Auto-Reply to Engagement:**

```
If reply contains interest keywords:
"interested" / "how" / "tell me more" / "DM me"
        ↓
n8n → Twitter API → send DM
"Hey [username], thanks for the interest!
Here's a quick overview: [link]
Would love to learn more about your business too."
        ↓
Add to CRM + qualify
```

**Tools:** Twitter API v2, n8n, OpenAI

---

## 📘 PLATFORM 8 — TELEGRAM GROUPS

### What's Different Here:

Telegram has an open bot API. Group posting requires admin access or approved posts.

### Step-by-Step Automation:

**Bot Setup:**

1. Create Telegram bot via @BotFather
2. Get bot token
3. Add bot to relevant groups (get admin approval)
4. n8n → Telegram Bot API → send messages to groups

**Posting to Groups:**

```
n8n Schedule Trigger (every 2 days)
        ↓
Generate enquiry post via OpenAI
        ↓
n8n HTTP Request → Telegram API
POST /sendMessage
  chat_id: [group_id]
  text: [generated post]
        ↓
Log in Google Sheets
```

**Monitoring Bot DMs:**

```
Telegram bot webhook → n8n
(anyone who messages your bot directly)
        ↓
Capture: user ID, username, message
        ↓
AI qualifies → send reply → add to CRM
```

**Tools:** Telegram Bot API, n8n, OpenAI

---

## 📘 PLATFORM 9 — REDDIT & QUORA (Authority + Lead Mining)

### What's Different Here:

Cannot post ads or direct enquiries. Strategy is to add value → attract inbound DMs.

### Step-by-Step Automation:

**Opportunity Detection (n8n):**

```
n8n Schedule Trigger (daily)
        ↓
HTTP Request → Reddit API
Search: "looking for accountant" OR "need marketing help" OR "outsource IT"
Filter: posts from last 24 hours, relevant subreddits
        ↓
Send digest to VA WhatsApp:
"5 Reddit opportunities to answer today:
1. [post title] - [link]
2. ..."
        ↓
VA manually writes helpful answer + links to free resource
        ↓
VA logs each comment in Google Sheets
```

**Quora (same flow, different API):**

1. n8n uses Apify Quora scraper to find relevant questions
2. VA receives daily list
3. VA answers with genuine insight
4. Profile links to website/newsletter

**Why manual here:** Reddit and Quora ban automated posts aggressively. The value is VA time (2 hours/day) generating organic authority.

---

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

# SECTION C — FULL n8n WORKFLOW ARCHITECTURE

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

## 🔧 MASTER n8n FLOWS TO BUILD

### Flow 1: Daily Content Generation

```
Trigger: Schedule (daily 7am)
→ HTTP Request: OpenAI (generate 5 posts per platform)
→ Set node: format for each platform
→ Google Sheets: write to content calendar
→ Buffer API: schedule LinkedIn + Twitter posts
→ Facebook Graph API: schedule Facebook page post
→ Slack/WhatsApp: send "Today's posts scheduled" confirmation
```

### Flow 2: Universal Lead Capture (Webhook)

```
Trigger: Webhook (receives data from any platform)
→ Set node: normalize data (name, email, platform, message)
→ Google Sheets: check for duplicate (VLOOKUP logic)
→ IF node:
   Duplicate → update existing row
   New → create new row
→ HTTP Request: OpenAI (qualify lead)
→ Switch node: route by classification
   HOT → Flow 3a
   WARM → Flow 3b
   COLD → Flow 3c
   PARTNER → Flow 3d
```

### Flow 3a: Hot Lead Fast Track

```
Trigger: Called by Flow 2
→ Google Sheets: update status to HOT
→ Mautic API: add to HOT sequence
→ WhatsApp API: alert sales person with full lead brief
→ Cal.com API: check availability and attach booking link
→ Wait 24h
→ IF: lead booked call?
   Yes → log, pause sequence
   No → send follow-up message
```

### Flow 3b: Warm Lead Nurture

```
Trigger: Called by Flow 2
→ Mautic API: add to WARM 14-day sequence
→ Google Sheets: update status, next action date = +14 days
→ Schedule: day 10 check — did they engage?
   Yes → upgrade to HOT
   No → continue sequence
```

### Flow 4: Email Reply Classifier

```
Trigger: Mautic webhook (email reply received)
→ HTTP Request: OpenAI (classify reply)
→ Switch node:
   Positive → Flow 3a
   Unsubscribe → Mautic API (remove) + Sheets update
   Spam → Blacklist in Sheets
   Info request → auto-send one-pager + flag VA
```

### Flow 5: Weekly Report

```
Trigger: Schedule (Monday 8am)
→ Google Sheets: read all leads from past 7 days
→ Calculate: total leads, HOT count, WARM count, calls booked
→ Set node: build report text
→ WhatsApp API: send report to team group
→ Mautic: send weekly newsletter to subscriber list
```

---

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

# SECTION D — COMPLETE TOOL STACK

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

## 🛠️ TOOLS BY FUNCTION

| Function | Tool | Cost | Why |
| --- | --- | --- | --- |
| Core automation | n8n (self-hosted) | Free | Connects everything |
| AI generation | OpenAI API (GPT-4o-mini) | ~$5/mo | Content + qualification |
| Social scheduling | Buffer | Free tier | LinkedIn, Twitter, Facebook |
| Email sequences | Mautic (self-hosted) | Free | Full email CRM |
| Lead data | [Apollo.io](http://Apollo.io) (free) | Free | 50 contacts/mo |
| Email finding | [Hunter.io](http://Hunter.io) (free) | Free | 25/mo |
| Email validation | [Reoon.com](http://Reoon.com) | ~$10/mo | Validate before send |
| Web scraping | Apify (free tier) | Free | Google Maps, forms |
| Browser automation | [Browserless.io](http://Browserless.io) | Free tier | Contact form filling |
| LinkedIn automation | PhantomBuster (free) | Free tier | Scraping + posting |
| WhatsApp | WhatsApp Business API | Free | Inbound + replies |
| CRM storage | Google Sheets | Free | Master database |
| Lead forms | [Tally.so](http://Tally.so) | Free | Audit + lead capture |
| Booking | [Cal.com](http://Cal.com) | Free | Meeting scheduling |
| Proposals | PandaDoc (free) | Free | Send + track proposals |
| URL tracking | [Dub.co](http://Dub.co) | Free | Track link clicks |
| VPS hosting | Hetzner | €4/mo | Host n8n + Mautic |

**Estimated monthly cost: €15–25/mo for full system**

---

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

# SECTION E — WHAT TO AUTOMATE VS WHAT STAYS HUMAN

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

## ✅ FULLY AUTOMATE THESE

- Content generation (daily posts, emails)
- Social media posting (LinkedIn, Facebook, Twitter, Instagram)
- Lead capture from all platforms
- Lead deduplication
- Email validation
- Lead scoring and qualification
- Email sequences (Mautic)
- Follow-up reminders
- CRM updates
- Weekly performance reports
- WhatsApp auto-replies (inbound only)
- Opportunity monitoring (Reddit, LinkedIn groups)

## 👤 KEEP HUMAN

- Sales calls and discovery conversations
- LinkedIn DM replies (after first auto-response)
- Reddit/Quora answers
- Relationship building with partners
- Closing deals
- Strategy discussions
- Negotiation
- High-value custom proposals

---

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

# SECTION F — IMPLEMENTATION TIMELINE

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

| Week | What to Build | Output |
| --- | --- | --- |
| Week 1 | VPS setup, install n8n + Mautic, build Google Sheets CRM | Infrastructure live |
| Week 2 | Flow 1 (content gen) + Buffer connected + OpenAI API key | Daily posts automated |
| Week 3 | Flow 2 (lead capture webhook) + Mautic sequences | Leads being captured |
| Week 4 | Email outreach: Apollo + Hunter + Mautic connected | Emails going out |
| Week 5 | Contact form scraper + Playwright on Browserless | Form outreach live |
| Week 6 | WhatsApp Business API + auto-reply bot | WhatsApp nurture live |
| Week 7 | Flow 5 (weekly report) + all monitoring flows | Full system running |
| Week 8+ | Review, optimize, scale | KPIs tracked, A/B testing |

---

*Last updated: May 2026 | Built for: Nivy Digital | System: n8n + Mautic + OpenAI + Multi-Platform*