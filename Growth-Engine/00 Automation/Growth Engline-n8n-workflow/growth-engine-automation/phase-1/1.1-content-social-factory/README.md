# Module 1.1 — Content → Social Factory

**Kya karta hai:** Har 30 minute me check karta hai ki Odoo Website Blog par koi naya post publish hua hai. Agar hua hai, to Ollama (Qwen 2.5 7B) se LinkedIn, X, Instagram, aur Facebook — chaaron platforms ke liye alag caption likhwata hai, phir Mixpost ke through automatically post kar deta hai.

```
Every 30 min (Schedule Trigger)
        ↓
Postgres: naya published blog post dhundo (jo abhi tak process nahi hua)
        ↓
Ollama: ek hi call me 4 platform-specific captions generate karo (JSON format me)
        ↓
Code node: JSON parse karo
        ↓
   ┌────┼────┬────┬──────────┐
LinkedIn  X  Instagram  Facebook   Postgres (mark as processed)
(sab Mixpost API se parallel post hote hain)
```

## Import Kaise Kare

1. n8n me: **Workflows → Import from File** → `workflow.json` select karo
2. Neeche diye gaye credentials aur placeholders set karo
3. Workflow ko **Active** karo (top-right toggle)

## Setup Karne Se Pehle — Zaroori Cheezein

### 1. Postgres credential (n8n me ek baar setup karo)
- n8n → Credentials → New → Postgres
- Host/Port/Database/User/Password = wahi jo aapke Odoo instance ki Postgres database ke hain
- Isi credential ko dono Postgres nodes me select karo (abhi JSON me `"id": "REPLACE_WITH_CREDENTIAL_ID"` likha hai — n8n UI me dropdown se apna credential select karte hi ye automatically set ho jaayega)

### 2. Control table banao (sirf ek baar, apne Postgres DB par run karo)
```sql
CREATE TABLE n8n_processed_posts (
  post_id INTEGER PRIMARY KEY,
  processed_at TIMESTAMP DEFAULT now()
);
```
Ye table track karta hai ki kaunsa blog post already social media par ja chuka hai, taaki duplicate post na ho.

### 3. Ollama
- Node 3 me URL `http://localhost:11434/api/generate` hai — agar Ollama alag server/container par chal raha hai to ye URL update kar do
- Model `qwen2.5:7b` pulled hona chahiye: `ollama pull qwen2.5:7b`

### 4. Mixpost — Environment Variables (n8n Settings → Variables, ya `.env`)

| Variable | Kya daalna hai |
|---|---|
| `MIXPOST_URL` | Aapki Mixpost instance ka base URL (e.g. `https://social.yourdomain.com`) |
| `MIXPOST_WORKSPACE_UUID` | Mixpost dashboard → Workspace settings se milega |
| `MIXPOST_TOKEN` | Mixpost → User menu → Access Tokens → Create |
| `MIXPOST_LINKEDIN_ACCOUNT_ID` | Mixpost me connected LinkedIn account ka ID |
| `MIXPOST_X_ACCOUNT_ID` | Connected X/Twitter account ka ID |
| `MIXPOST_INSTAGRAM_ACCOUNT_ID` | Connected Instagram account ka ID |
| `MIXPOST_FACEBOOK_ACCOUNT_ID` | Connected Facebook Page ka ID |

⚠️ **Important:** Endpoint (`/api/{workspaceUuid}/posts`) aur auth header confirmed hai Mixpost ke official docs se, lekin request body ke exact fields (`accounts`, `content`, `schedule`) Mixpost version ke hisaab se thoda vary kar sakte hain. Pehli baar run karne se pehle ek test post bhej ke response check kar lena — [docs.mixpost.app/api/posts/create](https://docs.mixpost.app/api/posts/create/) se confirm kar lena.

### 5. Blog post URL
Code node (`Parse Platform Posts JSON`) me `REPLACE-WITH-YOUR-DOMAIN.com` ko apne actual domain se replace kar do.

## Test Kaise Kare

1. Odoo Website → Blog me ek test post publish karo
2. n8n me workflow ko manually **Execute Workflow** se run karo (30 min wait mat karo)
3. Har node ka output check karo — especially "Ollama - Rewrite" ka response valid JSON aa raha hai ya nahi
4. Mixpost dashboard me jaake dekho post schedule/publish hua ya nahi

## Known Limitations (v1)

- Agar Ollama JSON format follow nahi karta (kabhi kabhi hota hai), to Code node fallback try karta hai, lekin agar wo bhi fail ho to empty caption jaayegi — is case me ek manual review step add karna recommend hai (Phase 1.1 v2 me)
- Postgres "mark as processed" Mixpost calls ke result ka wait nahi karta — agar Mixpost call fail ho jaaye tab bhi post processed maan liya jaayega. Production me isse improve karenge (retry + failure notification)
