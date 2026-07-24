# n8n Workflow 5 — Blog → Social Auto-Post

**Owner:** Nivy Digital Founder | **Status:** 🟢 Complete | **Last Updated:** May 2026 | **Section:** SD-08 Automation

**Tags:** `n8n` `workflow` `blog` `social-media` `auto-post` `SD-08`

---

> 🎯 **Purpose:** Automatically repurposes and distributes new blog posts to LinkedIn, Instagram, Twitter/X, and the WhatsApp Channel as soon as they are published.
> 

---

# ⚙️ Workflow Overview

**Trigger:** New blog post published on WordPress (RSS feed or webhook)

**Outcome:** Post auto-distributed to LinkedIn, Twitter/X, and WhatsApp Channel

**Tool:** n8n + RSS / WordPress webhook + social API integrations

---

# 🗓️ Step-by-Step Build

## Trigger Options:

**Option A — RSS Feed (simple):**

- Use n8n RSS node: monitor [[yoursite.com/feed](http://yoursite.com/feed)]
- Trigger: when new item appears
- Runs every 15 minutes

**Option B — WordPress Webhook (faster):**

- Install "WP Webhooks" plugin on WordPress
- Trigger: post_published event → send to n8n webhook URL

## Nodes:

1. **RSS / Webhook trigger** — receives new post data (title, URL, excerpt, category)
2. **Claude AI node** — generate a LinkedIn-optimised post from the blog title + excerpt
3. **LinkedIn API node** — post to LinkedIn company page
4. **Twitter/X API node** — post a tweet with title + link
5. **WhatsApp Business API node** — send to channel with title + link
6. **Wait node** — stagger posts by 30 minutes to look natural

## AI Prompt for LinkedIn Post Generation:

```
You are a social media writer for Nivy Digital, a business services company.

Blog post title: [TITLE]
Blog excerpt: [EXCERPT]

Write a LinkedIn post (max 1,300 characters) that:
- Starts with a strong hook (problem or insight)
- Summarises the key takeaway from the article
- Ends with: "Read the full article: [URL]"
- Tone: professional but conversational
- Do not use hashtags in the first line
- Add 3–5 relevant hashtags at the end
```

---

# ✅ Testing Checklist

- [ ]  Publish a test post on WordPress
- [ ]  Verify n8n workflow triggered
- [ ]  Verify LinkedIn post created on company page
- [ ]  Verify tweet posted
- [ ]  Verify WhatsApp channel message sent
- [ ]  Check timing — posts staggered correctly

---

📋 **PAGE METADATA** | **Section:** SD-08 | **Status:** 🟢 Complete | **Tags:** `n8n` `blog` `auto-post` `LinkedIn` `social-media` `SD-08`