# 🟨 Phase 3 — Systems (Month 2)

← [Back to Launch Plan](https://www.notion.so/35be5082b9d4813db1a7c3973215933f)

---

> **Goal: Now that you have 1-3 clients and money coming in, automate your follow-ups, set up n8n, and build professional delivery systems. You are graduating from hustle to systems.**
> 

---

## What You Will Have By End of Month 2

- n8n installed and running your first automation
- Automatic email follow-up sequences for new leads
- Professional weekly client reports being generated
- A Notion client dashboard for each client
- Your first AI-generated report sent to a client

---

## Week 5 — Install n8n (Your Automation Engine)

**What is n8n?** n8n is a free automation tool that connects your apps and runs tasks automatically — like sending a WhatsApp when a form is filled, or generating a weekly report and emailing it. It is like Zapier but free and more powerful.

**Option A — Easiest: n8n Cloud (Free trial, then $20/month)**

1. Go to [n8n.io](http://n8n.io)
2. Click "Start for free"
3. Sign up with your email
4. You get a free trial — use this first to learn
5. Once inside, you'll see a canvas where you build "workflows" (automations)

**Option B — Free Forever: Self-hosted on Railway (recommended once you have a client paying)**

1. Go to [railway.app](http://railway.app)
2. Sign up free with GitHub (you'll need a GitHub account — sign up at [github.com](http://github.com), it's free)
3. Once logged in to Railway, click "New Project"
4. Click "Deploy from template"
5. Search for "n8n" in the template search
6. Click the n8n template
7. Click "Deploy Now"
8. Wait 2-3 minutes for it to deploy
9. Click on your n8n service > click the URL it gives you (something like [n8n-production-xxxx.up.railway.app](http://n8n-production-xxxx.up.railway.app))
10. This opens your n8n instance — create an account (username and password)
11. You now have free n8n running 24/7

**Save your n8n URL. You will use it every day from now on.**

---

## Week 5 — Your First n8n Automation: Lead Notification

**This automation: When someone fills your Tally form, you instantly get a WhatsApp notification.**

**Step by step:**

1. Log in to your n8n instance
2. Click "+ New Workflow"
3. Click the "+" button to add first node
4. Search for "Tally" and select it
5. Select "Trigger" mode
6. Connect your Tally account (n8n will ask for your Tally API key — go to [tally.so](http://tally.so) > Settings > Integrations > API > copy your API key)
7. Select your lead capture form
8. Click "+" to add a second node
9. Search for "Telegram" (easier than WhatsApp to set up for notifications)
10. Set up Telegram bot (follow the steps below)

**Setting up Telegram bot for notifications (10 minutes):**

1. Open Telegram app on your phone
2. Search for "@BotFather" — it is the official bot creator
3. Start a chat and type /newbot
4. Give your bot a name: NivyAlerts
5. Give it a username: nivyalertsbot (must end in 'bot')
6. BotFather will give you a TOKEN — copy it and save it
7. Now search for your bot name in Telegram and start a chat with it
8. To get your chat ID: go to [t.me/userinfobot](http://t.me/userinfobot) — start it, it will show your ID
9. In n8n Telegram node: paste your Token and Chat ID
10. Set the message to: "New lead! Name: {{firstName}} {{lastName}} | WhatsApp: {{phone}} | Business: {{businessName}} | Budget: {{budget}} | Challenge: {{challenge}}"
11. Click "Test workflow" and submit a test form entry
12. You should get a Telegram message instantly
13. Click "Activate" to turn the workflow on

**You now get instant alerts every time someone fills your form.**

---

## Week 6 — Set Up OpenAI Account (For AI Reports)

**Why:** You will use OpenAI's GPT-4 to automatically write professional client reports. This saves you 2-3 hours per week per client.

**What to do:**

1. Go to [platform.openai.com](http://platform.openai.com)
2. Sign up with your email
3. Go to "API Keys" in the left menu
4. Click "Create new secret key"
5. Name it: Nivy n8n
6. Copy the key and save it somewhere safe (you will not see it again)
7. Add billing: Go to "Billing" > "Add payment method" — add a debit or credit card
8. Set a usage limit: Go to "Billing" > "Usage limits" > set monthly limit to $10 to start (enough for dozens of reports)
9. Note: GPT-4o costs roughly $0.01-0.05 per report. Very cheap.

---

## Week 6 — Build the Weekly Report Automation in n8n

**This automation: Every Monday, n8n pulls your client data and OpenAI writes a professional performance report, then emails it to you (you review and forward to client).**

**Step by step:**

1. In n8n, click "+ New Workflow"
2. Name it: "Weekly Client Report Generator"
3. Add first node: Search "Schedule Trigger"
    - Set to: Every Monday at 8:00am
4. Add second node: Search "Google Sheets"
    - First, create a Google Sheet (go to [sheets.google.com](http://sheets.google.com)) called "Nivy Client Data"
    - Columns: Client Name, Email, Service, Monthly Budget, Key Goal, GA4 Property ID, Meta Ad Account ID, Account Manager Name
    - Add your first client's data in row 1
    - Connect n8n to Google Sheets (click the credential setup, sign in with Google)
    - Set it to read from your sheet
5. Add third node: Search "HTTP Request"
    - URL: [https://api.openai.com/v1/chat/completions](https://api.openai.com/v1/chat/completions)
    - Method: POST
    - Headers: Add header "Authorization" = "Bearer YOUR_OPENAI_KEY"
    - Body (JSON):
    
    ```
    {
      "model": "gpt-4o",
      "max_tokens": 1000,
      "messages": [{"role": "user", "content": "Write a professional weekly performance report for my digital marketing client. Client name: {{clientName}}. Service: {{service}}. This week focus on: client communication, what we worked on this week, what's coming next week. Keep it warm, professional, and under 300 words. Format with clear sections."}]
    }
    ```
    
6. Add fourth node: Search "Gmail" or "Send Email"
    - To: your own email
    - Subject: "REVIEW BEFORE SENDING: {{clientName}} Weekly Report"
    - Body: the AI-generated report content
7. Activate the workflow

**Every Monday you will get an email with draft reports for every client. You review (takes 2 minutes each), personalize if needed, and forward to client.**

---

## Week 7 — Create Notion Client Dashboards

**Each client gets their own Notion page as their portal.**

**Create a template:**

1. In Notion, go to your CJE OS main page
2. Create a new page: "Client Portals"
3. Create a sub-page template called "CLIENT NAME — Project Dashboard"
4. Include these sections:
    - Client Overview (name, business, package, start date, AM name, renewal date)
    - Monthly Goals (what are we trying to achieve this month)
    - Deliverables Tracker (table with task, owner, due date, status)
    - KPI Tracker (table with metric, target, current, trend)
    - Monthly Reports (links to each month's report PDF)
    - Communication Log (date, what was discussed, action items)
    - Access & Logins (list of all accounts we have access to)
5. Duplicate this template for each new client
6. Share the Notion page with your client (click Share > Invite by email)

**Your client can now see their project dashboard at any time. This is a major trust-builder.**

---

## Week 8 — Email Nurture Sequence in Brevo

**For leads who didn't convert immediately, set up a 4-week email sequence that keeps Nivy top of mind.**

**What to do:**

1. Log in to [brevo.com](http://brevo.com)
2. Go to "Automations" > "Create an automation"
3. Trigger: Contact added to a list called "Warm Leads"
4. Create 4 emails:

Email 1 (Day 1 after they fill your form): Subject: "Your free marketing audit is ready" — Confirm you received their form, set expectation that you'll call within 24 hours, share one quick tip relevant to their industry.

Email 2 (Day 5): Subject: "The #1 marketing mistake [their industry] businesses make" — Educational content. No pitch. Just value. End with: "If you ever want to discuss your situation, my calendar link is always open: [Calendly link]"

Email 3 (Day 12): Subject: "A quick result we got for a business like yours" — Short case study or result. Real numbers if you have them. End with a soft CTA.

Email 4 (Day 21): Subject: "Still here if you need us" — Short, honest email. "I know the timing might not be right. Whenever you're ready to invest in your growth, we'll be here. In the meantime, here's a free resource: [link to a useful article or your Instagram]"

1. Set each email delay
2. Activate the automation

**Every lead who fills your Tally form now gets 4 weeks of follow-up automatically. You don't have to remember to follow up.**

---

## Budget for Phase 3

| Tool | Cost | When to Pay |
| --- | --- | --- |
| n8n Cloud OR Railway hosting | Free or $5-20/month | After your first client pays |
| OpenAI API | ~$5-10/month at start | After your first client pays |
| Everything else | Free | N/A |

**Only start paying for tools after you have client revenue coming in.**

---

## End of Phase 3 Checklist

| Task | Done? |
| --- | --- |
| n8n installed (Railway or cloud) | No |
| First automation live (Tally > Telegram alert) | No |
| OpenAI API key set up | No |
| Weekly report automation built in n8n | No |
| First AI report reviewed and sent to client | No |
| Notion client dashboard created for each client | No |
| Clients have access to their dashboards | No |
| Brevo email nurture sequence live (4 emails) | No |
| New leads automatically receive email sequence | No |

**When this checklist is complete, go to Phase 4.**