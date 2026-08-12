# Module 1.2 — SEO Automation (Weekly)

**Kya karta hai:** Har Monday 6AM ko automatically 3 kaam karta hai:
1. Google Search Console data khींchke Ollama se keyword opportunities + content gap topics nikalta hai
2. Odoo Website ki jin pages me meta description missing hai, unke liye Ollama se likhwa ke seedha database me update kar deta hai
3. Poori website ka sitemap crawl karke broken links (404/500 etc.) dhundta hai
4. In teeno ka combined HTML report bana ke email kar deta hai (Postal SMTP se)

```
Weekly Trigger (Mon 6AM)
   ├── GSC data → Ollama clustering → parse
   ├── Odoo pages missing meta → Ollama generates → Postgres UPDATE
   └── Sitemap fetch → extract URLs → loop (batch 10) → check status → collect broken
                                                              ↓ (loop done)
                                                    Build Report → Email Send
```

## Import Kaise Kare

1. n8n me: **Workflows → Import from File** → `workflow.json`
2. Neeche diye credentials/placeholders set karo
3. **Active** karo

## Setup Karne Se Pehle

### 1. Google Search Console credential
- n8n → Credentials → New → **Google API** (OAuth2)
- Google Cloud Console me Search Console API enable karo, OAuth client banao
- Environment variable `GSC_SITE_URL` set karo (e.g. `https://yourdomain.com/` — exact wahi format jo GSC property me registered hai)

### 2. Postgres credential
- Same "Odoo Postgres" credential jo Module 1.1 me banayi thi, wahi use kar lo
- Table/column name confirm kar lo apne Odoo version me: `website_page` table me `meta_description` column hona chahiye. Agar naam alag hai to query update kar do

### 3. Ollama
- Same setup jo 1.1 me tha (`http://localhost:11434`, model `qwen2.5:7b`)

### 4. Sitemap URL
- Node `Fetch Sitemap XML` me `REPLACE-WITH-YOUR-DOMAIN.com` ko apne actual domain se replace karo

### 5. Postal SMTP credential
- n8n → Credentials → New → **SMTP**
- Host/Port/User/Password = Postal ke SMTP credentials
- Node `Send Weekly SEO Report` me `fromEmail` aur `toEmail` apne actual addresses se replace karo

## Test Kaise Kare

1. Workflow ko manually **Execute Workflow** se run karo (Monday tak wait mat karo)
2. Har branch ka output check karo:
   - GSC data aa raha hai? (agar property verify nahi hai to yaha fail hoga)
   - Meta description update ho raha hai? (Odoo website me jaake ek page check karo)
   - Broken link check kaam kar raha hai? (ek intentionally broken URL sitemap me daal ke test kar sakte ho)
3. Final email inbox me report aaya ya nahi

## Known Limitations (v1)

- Sitemap se sirf pehle 100 URLs crawl hote hain (rate-limit/time consideration se) — bade site ke liye batch size ya limit badha sakte ho
- GSC data sirf top 200 rows leta hai — agar site bada hai to pagination add karna hoga (v2)
- Broken link check sirf status code dekhta hai, redirect chains ya slow-loading pages detect nahi karta
