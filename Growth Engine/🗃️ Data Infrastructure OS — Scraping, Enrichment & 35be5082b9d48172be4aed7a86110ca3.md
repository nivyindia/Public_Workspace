# 🗃️ Data Infrastructure OS — Scraping, Enrichment & CRM

← [Back to Master CJE Hub](https://www.notion.so/35be5082b9d481e38c42d3cadd012d94)

---

> **The data layer is the invisible foundation of the entire CJE system. Without clean, enriched, segmented data — every automation, every campaign, and every outreach effort underperforms. This OS governs how Nivy Digital finds, captures, cleans, enriches, and uses prospect data.**
> 

---

## 🗺️ Data Infrastructure Architecture

```
STRANGER DATA
     ↓
[1] SCRAPING — Find target prospects at scale
     ↓
[2] VALIDATION — Remove invalid/bouncy emails
     ↓
[3] ENRICHMENT — Add company size, role, tech stack, revenue
     ↓
[4] SEGMENTATION — Tag by ICP: industry, country, size, pain
     ↓
[5] CRM ENTRY — Structured contact in HubSpot
     ↓
[6] SCORING — AI-powered quality score assigned
     ↓
[7] ROUTING — Assigned to right sequence/team
     ↓
[8] TRACKING — Every interaction logged
     ↓
[9] REPORTING — Weekly data health dashboard
     ↓
CLEAN, ACTIONABLE PIPELINE
```

---

## 🔍 Layer 1 — Lead Scraping Systems

### B2B Database Scraping (Apollo)

| ICP Segment | Apollo Filters | Expected Volume |
| --- | --- | --- |
| UK E-commerce founders | Title: Founder/Director, Industry: E-commerce, Location: UK, Size: 1-25 | 300+/month |
| US Real estate SMBs | Title: Broker/CEO/Owner, Industry: Real Estate, Location: US, Size: 1-10 | 200+/month |
| Indian SaaS startups | Title: Founder/CEO, Industry: Tech/SaaS, Location: India, Size: 1-50 | 500+/month |
| UAE business owners | Title: GM/CEO/Owner, Location: UAE | 150+/month |
| Australian SMB owners | Title: MD/CEO, Size: 1-20, Location: AU | 200+/month |
| CA accounting firms | Title: Partner/Owner, Industry: Accounting, Location: Canada | 100+/month |

**Apollo Scraping SOP:**

1. Log into [Apollo.io](http://Apollo.io) → People Search
2. Apply ICP filters (title + industry + location + company size)
3. Export max 50 contacts (free plan) or bulk (paid)
4. Download CSV → validate in Reoon
5. Clean list → import to HubSpot
6. Tag: `source:apollo`, `campaign:[name]`, `country:[code]`

---

### LinkedIn Scraping (PhantomBuster)

| Phantom | Use Case | Daily Limit | Output |
| --- | --- | --- | --- |
| LinkedIn Search Export | Export leads from search URL | 150 profiles/day | CSV with name, title, company, LinkedIn URL |
| LinkedIn Profile Scraper | Deep scrape individual profiles | 50/day | Full profile data |
| LinkedIn Group Members | Scrape group member list | 100/day | Contact data from groups |
| Post Commenters Scraper | Export everyone who commented | Per post | Engaged prospect list |
| Company Employees Scraper | Find all employees of target company | Per company | Account-based targeting |

**PhantomBuster Setup:**

```
1. Connect PhantomBuster to LinkedIn (via cookies)
2. Set Phantom: LinkedIn Search Export
3. Input: Search URL from LinkedIn (with all filters applied)
4. Output: Google Sheet auto-populated
5. Schedule: Daily at 9am
6. n8n reads new rows → validates → pushes to HubSpot
```

---

### Google Maps Scraping (Apify)

Use for local business outreach — accountants, law firms, dental clinics, restaurants needing digital marketing.

**Apify Actor: Google Maps Scraper**

```jsx
Input:
{
  "searchStringsArray": ["digital marketing agency London", "accountant Manchester"],
  "maxCrawledPlacesPerSearch": 100,
  "language": "en",
  "outputAs": "json"
}

Output fields to capture:
- businessName
- address
- phone
- website
- email (if listed)
- rating
- reviewCount
- category
```

**n8n Flow: Maps Scrape → CRM:**

```
Apify webhook → n8n receives data
        ↓
Filter: rating > 3.5 AND has website
        ↓
Hunter.io API: find email from website domain
        ↓
Reoon: validate email
        ↓
HubSpot: create contact with tag source:maps
```

---

### Website Contact Form Scraping (Apify + Playwright)

For contact form outreach — find businesses, submit personalized enquiries through their website.

```jsx
// Playwright script for Browserless
const { chromium } = require('playwright');
async function fillContactForm(url, name, email, message) {
  const browser = await chromium.connectOverCDP(
    'wss://chrome.browserless.io?token=YOUR_BROWSERLESS_TOKEN'
  );
  const page = await browser.newPage();
  await page.goto(url, { waitUntil: 'networkidle', timeout: 30000 });
  
  const selectors = {
    name: ['input[name="name"]', 'input[id="name"]', 'input[placeholder*="name" i]', '#contact-name'],
    email: ['input[name="email"]', 'input[type="email"]', '#email'],
    message: ['textarea[name="message"]', 'textarea[id="message"]', '#message', '.message-field']
  };
  
  for (const sel of selectors.name) {
    if (await page.$(sel)) { await page.fill(sel, name); break; }
  }
  for (const sel of selectors.email) {
    if (await page.$(sel)) { await page.fill(sel, email); break; }
  }
  for (const sel of selectors.message) {
    if (await page.$(sel)) { await page.fill(sel, message); break; }
  }
  
  await page.waitForTimeout(Math.random() * 3000 + 2000);
  
  const submitSelectors = ['button[type="submit"]', 'input[type="submit"]', '.submit-btn', '#submit'];
  for (const sel of submitSelectors) {
    if (await page.$(sel)) { await page.click(sel); break; }
  }
  
  await page.waitForTimeout(2000);
  await browser.close();
  return { status: 'submitted', url, timestamp: new Date().toISOString() };
}
```

**Daily Limits:** Max 20 form submissions/day | Min 5 message variants | No repeat submissions

---

### Competitor Audience Scraping

| Target | Method | Tool |
| --- | --- | --- |
| Competitor LinkedIn followers | PhantomBuster LinkedIn Company Followers | PhantomBuster |
| Competitor Instagram followers | Apify Instagram Scraper | Apify |
| Competitor Facebook Group members | PhantomBuster Facebook Group Members | PhantomBuster |
| "Hiring VA" job posts | Apify Indeed/LinkedIn job scraper | Apify |

---

## ✅ Layer 2 — Email Validation

| Tool | Use Case | Accuracy | Cost |
| --- | --- | --- | --- |
| Reoon | Bulk validation before sending | 99%+ | ~$10/mo |
| NeverBounce | Alternative bulk validation | 99%+ | Pay per credit |
| [Hunter.io](http://Hunter.io) | Find + verify from domain | 95% | Free (25/mo) |
| Apollo built-in | Verify Apollo exports | 95% | Included |

**Validation Workflow:**

```
Raw email list
     ↓
Reoon bulk check
     ↓
Valid (✅) → keep → enrich
Risky (⚠️) → flag → manual review
Invalid (❌) → discard immediately
Disposable (🚫) → blacklist domain
     ↓
Clean list ready for outreach
```

**Bounce Rate Targets:**

- Cold email: <2% hard bounce rate (protect domain reputation)
- Newsletter: <1% hard bounce rate

---

## 🔬 Layer 3 — Lead Enrichment

| Enrichment Field | Source Tool | Purpose |
| --- | --- | --- |
| Company name & size | Apollo / Clay | Segment by company scale |
| Industry + sub-industry | Apollo / Clearbit | Personalize messaging |
| LinkedIn profile URL | PhantomBuster / Clay | Add LinkedIn to CRM |
| Tech stack (website CMS, tools) | BuiltWith API / Clay | Tech-relevant pitches |
| Annual revenue estimate | Clay / Apollo | Know budget capacity |
| Company founding year | Clay / Crunchbase | Context for messaging |
| Recent funding/news | Clay + Perplexity | Hyper-personalization |
| Social media profiles | Clay | Omnichannel outreach |

**Clay Enrichment Flow (n8n → Clay API):**

```json
{
  "name": "Nivy - Lead Enrichment via Clay",
  "nodes": [
    {
      "parameters": { "httpMethod": "POST", "path": "enrich-lead" },
      "name": "Trigger: New HubSpot Contact",
      "type": "n8n-nodes-base.webhook",
      "position": [100, 300]
    },
    {
      "parameters": {
        "url": "https://api.clay.com/v1/enrich",
        "method": "POST",
        "bodyParametersUi": {
          "parameter": [
            { "name": "email", "value": "={{$json.email}}" },
            { "name": "company", "value": "={{$json.company}}" },
            { "name": "apiKey", "value": "YOUR_CLAY_API_KEY" }
          ]
        }
      },
      "name": "Clay Enrichment API",
      "type": "n8n-nodes-base.httpRequest",
      "position": [320, 300]
    },
    {
      "parameters": {
        "resource": "contact",
        "operation": "update",
        "contactId": "={{$json.hubspot_id}}",
        "properties": {
          "company_size": "={{$json.enriched.employee_count}}",
          "industry": "={{$json.enriched.industry}}",
          "linkedin_url": "={{$json.enriched.linkedin_url}}",
          "annual_revenue": "={{$json.enriched.annual_revenue}}",
          "tech_stack": "={{$json.enriched.technologies.join(', ')}}"
        }
      },
      "name": "Update HubSpot Contact",
      "type": "n8n-nodes-base.hubspot",
      "position": [540, 300]
    }
  ],
  "connections": {
    "Trigger: New HubSpot Contact": { "main": [[{ "node": "Clay Enrichment API", "type": "main", "index": 0 }]] },
    "Clay Enrichment API": { "main": [[{ "node": "Update HubSpot Contact", "type": "main", "index": 0 }]] }
  }
}
```

---

## 🗂️ Layer 4 — Segmentation System

| Tag Type | Values | Purpose |
| --- | --- | --- |
| Country | `country:uk`, `country:us`, `country:uae`, `country:au`, `country:in`, `country:ca` | Geographic targeting |
| Industry | `ind:ecommerce`, `ind:realestate`, `ind:tech`, `ind:accounting`, `ind:legal`, `ind:healthcare` | Industry-specific messaging |
| Company size | `size:solo`, `size:small` (2-10), `size:mid` (11-50), `size:large` (50+) | Package recommendations |
| Service interest | `svc:va`, `svc:accounting`, `svc:marketing`, `svc:webdev`, `svc:automation` | Right-service routing |
| Lead source | `src:apollo`, `src:linkedin`, `src:website`, `src:referral`, `src:maps`, `src:social` | Attribution |
| Lead status | `status:cold`, `status:warm`, `status:hot`, `status:client`, `status:lost`, `status:partner` | Pipeline stage |
| Sequence | `seq:coldmail1`, `seq:warmwelcome`, `seq:hottrack`, `seq:reactivation` | Which sequence active |

---

## 🏗️ Layer 5 — CRM Architecture (HubSpot)

**Contact Properties (Custom):**

- `ai_qualification_score` — Numeric (HOT=3, WARM=2, COLD=1)
- `ai_pain_point` — Text
- `ai_recommended_service` — Text
- `lead_source_detail` — Text (specific campaign)
- `outreach_sequence_active` — Text
- `last_outreach_date` — Date
- `response_count` — Number
- `country_code` — Text
- `industry_tag` — Text
- `nivy_client_since` — Date

**HubSpot Pipeline Stages:**

```
Stage 1: ATTENTION (source tracked)
Stage 2: INTERESTED (engaged with content)
Stage 3: LEAD (captured in CRM)
Stage 4: QUALIFIED (AI scored HOT/WARM)
Stage 5: CALL BOOKED
Stage 6: PROPOSAL SENT
Stage 7: NEGOTIATING
Stage 8: CLIENT WON
Stage 9: CLIENT LOST (reason tagged)
Stage 10: REACTIVATION CANDIDATE
```

---

## 📊 Data Health KPIs

| KPI | Target | Frequency |
| --- | --- | --- |
| Email validity rate (in CRM) | >95% | Monthly |
| Enrichment completion rate | >80% of contacts | Monthly |
| Duplicate contact rate | <3% | Monthly |
| Contacts with country tag | 100% | Weekly |
| Contacts with service interest tag | >90% | Weekly |
| Data entered within 24hrs of capture | 100% | Daily |
| Blacklist / unsubscribe compliance | 100% | Ongoing |

---

## 🛠️ Full Data Infrastructure Tool Stack

| Tool | Role | Cost |
| --- | --- | --- |
| [Apollo.io](http://Apollo.io) | B2B lead database + email finding | Free (50/mo) |
| PhantomBuster | LinkedIn + social scraping | Free tier |
| Apify | Google Maps + web scraping | Free tier |
| Clay | Multi-source enrichment | Free tier |
| [Hunter.io](http://Hunter.io) | Domain → email finding | Free (25/mo) |
| Reoon | Email validation | ~$10/mo |
| Browserless | Contact form automation | Free tier |
| HubSpot | Master CRM | Free |
| n8n | Orchestration of all flows | Free (self-hosted) |
| Google Sheets | Staging area + reporting | Free |

**Estimated monthly cost: ~$10-20/mo**

---

## 🔗 Connected Systems

- [🎣 SD-03 — Lead Generation & Data Hub](https://www.notion.so/359e5082b9d481429921cdc02141c77a)
- [🤖 Nivy Digital — Complete Sales Automation via Enquiry Method](https://www.notion.so/ea0e5082b9d4829cb8bb01d3eb56f514)
- [🎯 Stage 1 — Attention Engine](https://www.notion.so/35be5082b9d48146b861fb656552d81b)
- [🗂️ Stage 4 — Lead Management Engine](https://www.notion.so/35be5082b9d48137bf97c23f5343c1c4)