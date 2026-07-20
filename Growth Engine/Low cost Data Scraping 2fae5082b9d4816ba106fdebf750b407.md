# Low cost Data Scraping

Got it 👍

You want **clear understanding + practical ways** to extract **US restaurant company data + decision-maker details**, **mostly free or very low cost**, using tools, extensions, scripts, Python, etc.

I’ll break this into **HOW IT’S POSSIBLE**, **WHAT YOU CAN & CAN’T GET FOR FREE**, and **STEP-BY-STEP SYSTEM** (realistic, not sales-page fantasy).

---

# 🎯 TARGET YOU WANT

**Restaurants in USA**

- Employees: **10–500**
- Revenue: **$0–50M**
- Data needed:
    - Company name
    - Website
    - Business email
    - Phone
    - Decision makers (Owner / Founder / GM / Marketing Head)
    - Personal email (if possible)
    - LinkedIn
    - Social profiles

---

# ⚠️ REALITY CHECK (IMPORTANT)

❌ **No single free tool gives ALL this data legally**

✅ But you **CAN stitch together 80–90% of it** using **public sources + automation**

The trick is:

> Scrape public business data → infer company size → find people → enrich emails
> 

---

# 🧠 OVERALL FREE SYSTEM (BIG PICTURE)

```
Google Maps / Directories
        ↓
Company Website Scraping
        ↓
LinkedIn (Public)
        ↓
Email Guessing + Verification
        ↓
Clean Sheet / CRM

```

No Apollo / ZoomInfo required.

---

# 🧰 TOOLS YOU’LL USE (FREE / FREEMIUM)

### 🔹 Scraping & Data Collection

- **Apify (free credits)**
- **Instant Data Scraper (Chrome)**
- **Phantombuster (free daily runs)**
- **Python (BeautifulSoup / Playwright)**

### 🔹 Employee Size & Revenue Estimation

- LinkedIn company page
- Crunchbase (free view)
- Company “About Us” text

### 🔹 People Finding

- LinkedIn public profiles
- Company “Team” / “Contact” pages

### 🔹 Email Guessing & Verification

- Hunter (free 25/month)
- Snov.io (free)
- Email permutator scripts
- Gmail SMTP check (Python)

---

# ✅ STEP-BY-STEP (100% PRACTICAL)

---

## STEP 1: GET RESTAURANT COMPANIES (FREE)

### 🔥 BEST FREE SOURCE: **Google Maps**

Search:

```
Restaurants in Texas
Restaurants in California
Restaurants in New York

```

### Tools:

- **Apify Google Maps Scraper**
- OR **Instant Data Scraper Chrome Extension**

### You’ll get:

✔️ Company Name

✔️ Website

✔️ Phone

✔️ Address

✔️ Google rating

💡 This already gives **10,000+ restaurants**

---

## STEP 2: FILTER BY COMPANY SIZE (10–500 Employees)

Google Maps doesn’t show employees → workaround 👇

### Method A: LinkedIn Company Page (Free)

1. Take company name
2. Search on Google:
    
    ```
    Company Name + LinkedIn
    
    ```
    
3. Open LinkedIn company page
4. Check:
    
    ```
    Employees on LinkedIn: 11–50 / 51–200 / 201–500
    
    ```
    

👉 Automatable with:

- **Apify LinkedIn Company Scraper**
- **Phantombuster**

---

### Method B: Website Signals (Semi-Automated)

Scrape website pages:

- /about
- /careers
- /team

Clues:

- “We are a team of 120+”
- Multiple locations
- Hiring pages = growing company

Python can flag these keywords automatically.

---

## STEP 3: ESTIMATE REVENUE (FREE WAY)

You **cannot get exact revenue for free**, but you can **estimate**.

### Heuristics:

| Signal | Revenue Hint |
| --- | --- |
| 1 location | <$2M |
| 5–10 locations | $5–20M |
| Franchise | $20M+ |
| Employees >200 | $20–50M |

Use:

- Website locations
- Google Maps branches
- LinkedIn size

This is **how Apollo & ZoomInfo estimate too**.

---

## STEP 4: FIND DECISION MAKERS (FREE)

### Target Roles:

- Owner
- Founder
- Managing Director
- General Manager
- Marketing Manager

### How:

### Method A: LinkedIn Public Search

Google search:

```
Owner "Company Name" site:linkedin.com

```

Scrape:

- Name
- Title
- LinkedIn URL

Tools:

- Apify LinkedIn Profile Scraper
- Phantombuster

---

### Method B: Company Website

Scrape:

- /team
- /about-us
- /leadership

Often restaurants list owners.

---

## STEP 5: GET EMAILS (FREE / SEMI-FREE)

### Rule:

> Emails are NOT scraped directly
> 
> 
> They are **guessed + verified**
> 

### How:

### Step 1: Find company email pattern

Check:

- Contact page
- Footer

Example:

```
info@company.com

```

Common patterns:

- [firstname@company.com](mailto:firstname@company.com)
- [firstname.lastname@company.com](mailto:firstname.lastname@company.com)

---

### Step 2: Generate emails

Use:

- Email permutator (free)
- Python script

Example:

```
john@restaurant.com
john.smith@restaurant.com
jsmith@restaurant.com

```

---

### Step 3: Verify emails

Free tools:

- Hunter (limited)
- Snov.io
- Python SMTP verification

This gives **70–80% valid emails**.

---

## STEP 6: SOCIAL LINKS (EASY & FREE)

From:

- Website footer
- Google Maps
- LinkedIn company page

Scrape:

✔️ Facebook

✔️ Instagram

✔️ Twitter

---

# 🐍 PYTHON AUTOMATION (FREE POWER)

You can automate **everything above** with Python:

### Libraries:

```python
requests
beautifulsoup4
playwright
pandas

```

### What Python can do:

- Scrape Google Maps results
- Visit websites automatically
- Extract emails & phones
- Crawl team pages
- Generate email permutations
- Export clean CSV

💡 This is **how data brokers work internally**

---

# 📊 FINAL DATA YOU’LL ACHIEVE (REALISTIC)

| Field | Success Rate |
| --- | --- |
| Company name | 100% |
| Website | 90% |
| Phone | 95% |
| Employee size (estimated) | 85% |
| Revenue range (estimated) | 70% |
| Decision maker name | 75% |
| LinkedIn | 80% |
| Business email | 65–80% |

**Cost: $0 – $20/month** (mostly proxies & free credits)

---

# ⚠️ LEGAL NOTE (IMPORTANT)

- Use **B2B outreach only**
- Avoid personal Gmail scraping
- Respect opt-outs
- Cold email laws (CAN-SPAM / GDPR)

---

# 🧠 TL;DR (ONE-LINE SYSTEM)

> Google Maps → Website → LinkedIn → Email guessing → Verification → CSV
> 

---

If you want next:

- ✅ **Exact Python scripts**
- ✅ **Apify actor list**
- ✅ **No-code Google Sheet workflow**
- ✅ **Restaurant-specific scraping SOP**

Just tell me which one you want and I’ll build it cleanly for you 🚀