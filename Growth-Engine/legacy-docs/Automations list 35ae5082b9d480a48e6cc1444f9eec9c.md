# Automations list

> **⚠️ SUPERSEDED — Legacy automations index**
> This page is part of the legacy Notion automation documentation (predating the Sales Funnel/Marketing rebuild). As of the Batch 6 structural consolidation (Correction Implementation Plan), the **canonical, actively-maintained system is the 54-stage Sales Funnel + 22-module Marketing system** (`Sales Funnel/IMPLEMENTATION-PLAN.md` and `Marketing/MARKETING-IMPLEMENTATION-PLAN.md`).
> This file is kept in place for historical reference only and is not being actively updated. Left in place (not moved to a separate archive folder) so existing internal Notion links don't break — this notice is the cross-link.
>


Here's the complete master plan — every automation, every channel, every stage of the funnel.Here's your complete master plan — **48 automations** across every channel and strategy. You can filter by funnel stage, direction (inbound/outbound), and category. Click any card to expand and see the full description + tools stack.

Here's the full breakdown of what's covered:

---

**🔍 Outbound · Data Scraping & Lead Gen (8 automations)**
Google X-Ray, Apollo, LinkedIn Sales Nav scraper, JustDial/IndiaMart scraper, Google Maps Business scraper, Hunter.io + Clearbit email finder, Reddit/Quora intent scraper, Twitter/X scraper — all feeding S1 → S2.

**📤 Outbound · Cold Outreach (7 automations)**
Cold email drip (Instantly/Lemlist), LinkedIn connection sequences, WhatsApp bulk outreach, SMS campaigns, cold calling auto-dialer, Clay.com hyper-personalization, video prospecting — moving S2 → S4.

**📥 Inbound · Content & Publishing (7 automations)**
AI blog pipeline, LinkedIn content calendar, Reels/Shorts factory, YouTube long-form, Twitter threads, Google Business Profile posting, Quora/Reddit authority posting — driving S1 → S2.

**🎯 Lead Capture & Nurture (6 automations)**
Landing page funnels, chatbot qualifier, Meta lead ads, Google Ads → CRM, email drip sequences per vertical, webinar funnel — S2 → S4.

**🔄 Retargeting (4 automations)**
Meta Pixel retargeting, Google Display/YouTube remarketing, email re-engagement, WhatsApp re-engagement broadcast — S3 → S4.

**💰 Sales Conversion (4 automations)**
Auto-booking via Calendly, AI proposal generator, deal follow-up reminders, payment + invoice automation — S4 → S5.

**🔁 Retention, Upsell & Referral (5 automations)**
Client onboarding, monthly report generation, cross-vertical upsell triggers, review collection bot, referral program — S5 → S6 → back to S1.

**⚡ Growth Hacking & Unconventional (7 automations)**
Competitor SEO gap attack, LinkedIn engagement pods, HARO PR automation, job board scraper for recruitment vertical, GST/MCA database mining, viral giveaway funnel, fully autonomous AI SDR agent — S1 → S4.

---

Tell me which ones you want me to actually **build first** — I'll start with the automation tool/workflow itself.

```jsx
import { useState } from "react";

const stages = [
  { id: "S1", label: "AWARENESS", color: "#FF6B35", short: "Top of Funnel" },
  { id: "S2", label: "INTEREST", color: "#F7C59F", short: "Mid Funnel" },
  { id: "S3", label: "CONSIDERATION", color: "#EFEFD0", short: "Mid Funnel" },
  { id: "S4", label: "INTENT", color: "#004E89", short: "Bottom Funnel" },
  { id: "S5", label: "CONVERSION", color: "#1A936F", short: "Revenue" },
  { id: "S6", label: "RETENTION", color: "#88D498", short: "LTV" },
];

const automations = [
  // ─── OUTBOUND DATA ACQUISITION ───
  {
    id: 1,
    category: "🔍 OUTBOUND · DATA SCRAPING & LEAD GEN",
    name: "Google X-Ray Search Scraper",
    description: "Automated Google dork queries: site:linkedin.com/in 'title' 'city' — extracts names, roles, emails from public pages. Runs on schedule via Python + SerpAPI.",
    tools: ["Python", "SerpAPI", "BeautifulSoup", "Google Sheets"],
    from: "S1",
    to: "S2",
    channel: "Google",
    type: "outbound",
  },
  {
    id: 2,
    category: "🔍 OUTBOUND · DATA SCRAPING & LEAD GEN",
    name: "Apollo.io Bulk Lead Extraction",
    description: "Filter by industry, company size, job title, location. Bulk export verified emails + phone numbers. Auto-sync to CRM via Zapier webhook.",
    tools: ["Apollo.io", "Zapier", "HubSpot/Sheets"],
    from: "S1",
    to: "S2",
    channel: "Apollo",
    type: "outbound",
  },
  {
    id: 3,
    category: "🔍 OUTBOUND · DATA SCRAPING & LEAD GEN",
    name: "LinkedIn Sales Navigator Scraper",
    description: "PhantomBuster or Apify scrapes search results, connection profiles, post engagers. Extracts decision-maker contact data for all Nivy verticals.",
    tools: ["PhantomBuster", "Apify", "LinkedIn Sales Nav"],
    from: "S1",
    to: "S2",
    channel: "LinkedIn",
    type: "outbound",
  },
  {
    id: 4,
    category: "🔍 OUTBOUND · DATA SCRAPING & LEAD GEN",
    name: "JustDial / IndiaMart / Sulekha Scraper",
    description: "Scrape local Indian business directories for SME leads: name, phone, category, location. Target Lucknow + UP businesses needing Nivy services.",
    tools: ["Python", "Selenium", "Sheets"],
    from: "S1",
    to: "S2",
    channel: "Directories",
    type: "outbound",
  },
  {
    id: 5,
    category: "🔍 OUTBOUND · DATA SCRAPING & LEAD GEN",
    name: "Google Maps Business Scraper",
    description: "Extract all businesses in a geo radius with category filter — phone, email, ratings, website. Feed into outreach pipeline for local SME targeting.",
    tools: ["Apify Google Maps", "Make.com", "Sheets"],
    from: "S1",
    to: "S2",
    channel: "Google Maps",
    type: "outbound",
  },
  {
    id: 6,
    category: "🔍 OUTBOUND · DATA SCRAPING & LEAD GEN",
    name: "Hunter.io + Clearbit Email Finder",
    description: "Given company domain, auto-find verified email patterns. Enrich with company size, revenue, tech stack. Waterfall enrichment: Hunter → Clearbit → Apollo fallback.",
    tools: ["Hunter.io", "Clearbit", "Apollo", "n8n"],
    from: "S1",
    to: "S2",
    channel: "Email",
    type: "outbound",
  },
  {
    id: 7,
    category: "🔍 OUTBOUND · DATA SCRAPING & LEAD GEN",
    name: "Reddit / Quora Intent Scraper",
    description: "Monitor keywords like 'need accountant Lucknow', 'best digital agency UP', 'job placement help'. Alert team + auto-draft reply with Nivy pitch.",
    tools: ["PhantomBuster", "Reddit API", "Make.com"],
    from: "S1",
    to: "S2",
    channel: "Community",
    type: "outbound",
  },
  {
    id: 8,
    category: "🔍 OUTBOUND · DATA SCRAPING & LEAD GEN",
    name: "Twitter/X Advanced Search Scraper",
    description: "Monitor intent signals: people asking for services Nivy offers. Apify Twitter scraper → filter by keywords → auto-DM or tag for manual outreach.",
    tools: ["Apify", "Twitter API", "Make.com"],
    from: "S1",
    to: "S2",
    channel: "Twitter/X",
    type: "outbound",
  },

  // ─── OUTBOUND OUTREACH ───
  {
    id: 9,
    category: "📤 OUTBOUND · COLD OUTREACH AUTOMATION",
    name: "Cold Email Drip Sequence (Instantly / Lemlist)",
    description: "5-step personalized cold email sequence with spintax. Day 1 intro → Day 3 value email → Day 5 case study → Day 8 objection handle → Day 12 breakup. Auto-track opens/clicks/replies.",
    tools: ["Instantly.ai", "Lemlist", "Clay.com"],
    from: "S2",
    to: "S4",
    channel: "Email",
    type: "outbound",
  },
  {
    id: 10,
    category: "📤 OUTBOUND · COLD OUTREACH AUTOMATION",
    name: "LinkedIn Connection + Message Sequence",
    description: "PhantomBuster: auto-connect with personalized note → if accepted, send message D2 → follow up D5 → final D10. Rate-limited to stay within LinkedIn limits.",
    tools: ["PhantomBuster", "Dux-Soup", "Make.com"],
    from: "S2",
    to: "S4",
    channel: "LinkedIn",
    type: "outbound",
  },
  {
    id: 11,
    category: "📤 OUTBOUND · COLD OUTREACH AUTOMATION",
    name: "WhatsApp Bulk Outreach (Wati / AiSensy)",
    description: "Template-approved WhatsApp messages to scraped/opted phone numbers. Personalized per vertical (edu, health, tax etc). Reply triggers CRM entry + human handoff.",
    tools: ["Wati", "AiSensy", "WhatsApp Business API"],
    from: "S2",
    to: "S4",
    channel: "WhatsApp",
    type: "outbound",
  },
  {
    id: 12,
    category: "📤 OUTBOUND · COLD OUTREACH AUTOMATION",
    name: "SMS Cold Outreach (Textlocal / MSG91)",
    description: "SMS blasts for local Indian audience with short link to landing page. Segment by service interest. Track click-throughs into CRM pipeline.",
    tools: ["MSG91", "Textlocal", "Bitly"],
    from: "S2",
    to: "S3",
    channel: "SMS",
    type: "outbound",
  },
  {
    id: 13,
    category: "📤 OUTBOUND · COLD OUTREACH AUTOMATION",
    name: "Cold Calling Auto-Dialer + Script AI",
    description: "JustCall or Aircall auto-dialer pulls leads from CRM. AI-generated call scripts per persona. Post-call: auto-log, auto-schedule follow-up, auto-send recap email.",
    tools: ["JustCall", "Aircall", "CRM", "Claude API"],
    from: "S2",
    to: "S4",
    channel: "Phone",
    type: "outbound",
  },
  {
    id: 14,
    category: "📤 OUTBOUND · COLD OUTREACH AUTOMATION",
    name: "Clay.com Hyper-Personalization Pipeline",
    description: "Enrich leads with LinkedIn, company news, website data → Claude writes 1-liner personalized icebreaker per lead → auto-inject into email/LinkedIn template.",
    tools: ["Clay.com", "Claude API", "Instantly.ai"],
    from: "S2",
    to: "S3",
    channel: "Multi-channel",
    type: "outbound",
  },
  {
    id: 15,
    category: "📤 OUTBOUND · COLD OUTREACH AUTOMATION",
    name: "Video Prospecting (Loom / Bonjoro)",
    description: "Personalized 60-sec video recorded per prospect with their name/company on screen. Auto-sent via Loom link in email for high-value leads. Boosts reply rate 3-5x.",
    tools: ["Loom", "Bonjoro", "Lemlist"],
    from: "S3",
    to: "S4",
    channel: "Email + LinkedIn",
    type: "outbound",
  },

  // ─── INBOUND CONTENT ───
  {
    id: 16,
    category: "📥 INBOUND · CONTENT CREATION & PUBLISHING",
    name: "AI Blog + SEO Article Pipeline",
    description: "Keyword research (Ahrefs/Semrush) → Claude drafts 1500-word SEO article → human review → auto-publish to WordPress via API → auto-share on social → auto-index Google.",
    tools: ["Claude API", "WordPress API", "Ahrefs", "Make.com"],
    from: "S1",
    to: "S2",
    channel: "Blog / SEO",
    type: "inbound",
  },
  {
    id: 17,
    category: "📥 INBOUND · CONTENT CREATION & PUBLISHING",
    name: "LinkedIn Content Calendar Automation",
    description: "Claude generates 30-day content plan → writes posts with hooks, CTAs, hashtags → schedules via Buffer/Taplio → auto-engage with comments using AI reply suggestions.",
    tools: ["Claude API", "Taplio", "Buffer", "Make.com"],
    from: "S1",
    to: "S2",
    channel: "LinkedIn",
    type: "inbound",
  },
  {
    id: 18,
    category: "📥 INBOUND · CONTENT CREATION & PUBLISHING",
    name: "Instagram Reels / YouTube Shorts Factory",
    description: "Topic → Claude script → ElevenLabs voiceover → HeyGen avatar or stock video → CapCut auto-edit → auto-upload via API to IG + YT + Facebook. 5 videos/week.",
    tools: ["Claude API", "ElevenLabs", "HeyGen", "CapCut API"],
    from: "S1",
    to: "S2",
    channel: "Instagram / YouTube",
    type: "inbound",
  },
  {
    id: 19,
    category: "📥 INBOUND · CONTENT CREATION & PUBLISHING",
    name: "YouTube Long-Form Auto-Publishing",
    description: "Script → record or AI avatar → auto-add captions (Whisper) → auto-generate thumbnail (Canva API) → schedule upload → auto-post timestamp chapters in description.",
    tools: ["YouTube API", "Whisper", "Canva API", "Claude API"],
    from: "S1",
    to: "S2",
    channel: "YouTube",
    type: "inbound",
  },
  {
    id: 20,
    category: "📥 INBOUND · CONTENT CREATION & PUBLISHING",
    name: "Twitter/X Thread Auto-Posting",
    description: "Claude generates viral thread format from blog post or topic → schedule via Typefully → auto-reply to comments with CTAs → track engagement for retargeting.",
    tools: ["Claude API", "Typefully", "Make.com"],
    from: "S1",
    to: "S2",
    channel: "Twitter/X",
    type: "inbound",
  },
  {
    id: 21,
    category: "📥 INBOUND · CONTENT CREATION & PUBLISHING",
    name: "Google Business Profile Post Automation",
    description: "Weekly auto-post to GBP with offers, updates, photos via Google My Business API. Boosts local SEO and keeps profile active for 'near me' searches.",
    tools: ["Google My Business API", "Make.com", "Canva API"],
    from: "S1",
    to: "S2",
    channel: "Google Local",
    type: "inbound",
  },
  {
    id: 22,
    category: "📥 INBOUND · CONTENT CREATION & PUBLISHING",
    name: "Quora / Reddit Authority Posting",
    description: "Monitor questions in Nivy's service areas → Claude drafts helpful answer with soft CTA → human approves → post. Builds authority + drives organic traffic.",
    tools: ["Claude API", "Reddit API", "Zapier"],
    from: "S1",
    to: "S2",
    channel: "Community",
    type: "inbound",
  },

  // ─── LEAD CAPTURE ───
  {
    id: 23,
    category: "🎯 LEAD CAPTURE & NURTURE",
    name: "Landing Page + Lead Magnet Funnel",
    description: "Vertical-specific landing pages (edu/health/tax/jobs) with lead magnet (free guide/checklist) → email capture → instant delivery → enters drip sequence.",
    tools: ["Unbounce", "Mailchimp", "Make.com", "WordPress"],
    from: "S2",
    to: "S3",
    channel: "Website",
    type: "inbound",
  },
  {
    id: 24,
    category: "🎯 LEAD CAPTURE & NURTURE",
    name: "Chatbot Lead Qualifier (Website + WhatsApp)",
    description: "AI chatbot on website + WhatsApp asks qualification questions, captures name/email/need/budget → routes to correct vertical team → creates CRM entry automatically.",
    tools: ["Landbot", "ManyChat", "Wati", "HubSpot"],
    from: "S2",
    to: "S3",
    channel: "Website + WhatsApp",
    type: "inbound",
  },
  {
    id: 25,
    category: "🎯 LEAD CAPTURE & NURTURE",
    name: "Facebook / Instagram Lead Ad Automation",
    description: "Meta Lead Ads → instant sync to CRM via Zapier → auto-WhatsApp message within 2 min of form fill → auto-assign to sales rep → reminder if no contact in 24h.",
    tools: ["Meta Ads", "Zapier", "Wati", "CRM"],
    from: "S2",
    to: "S3",
    channel: "Meta Ads",
    type: "inbound",
  },
  {
    id: 26,
    category: "🎯 LEAD CAPTURE & NURTURE",
    name: "Google Ads → CRM Auto-Pipeline",
    description: "Google Search/Display Ads → landing page → form fill → auto-create deal in CRM → assign owner → trigger nurture sequence → book discovery call automatically.",
    tools: ["Google Ads", "HubSpot", "Calendly", "Make.com"],
    from: "S2",
    to: "S3",
    channel: "Google Ads",
    type: "inbound",
  },
  {
    id: 27,
    category: "🎯 LEAD CAPTURE & NURTURE",
    name: "Email Nurture Drip Sequences (Per Vertical)",
    description: "6-week automated email sequences per service vertical. Education → Healthcare → Tax → Jobs → Digital. Value-first approach: tips, case studies, social proof, offer.",
    tools: ["Mailchimp", "ActiveCampaign", "Make.com"],
    from: "S3",
    to: "S4",
    channel: "Email",
    type: "inbound",
  },
  {
    id: 28,
    category: "🎯 LEAD CAPTURE & NURTURE",
    name: "Webinar / Free Workshop Funnel",
    description: "Promote free webinar on pain point → register → reminder sequence → live/recorded session → pitch Nivy service at end → follow-up sequence to non-buyers.",
    tools: ["Zoom", "Demio", "ActiveCampaign", "Make.com"],
    from: "S2",
    to: "S4",
    channel: "Webinar",
    type: "inbound",
  },

  // ─── RETARGETING ───
  {
    id: 29,
    category: "🔄 RETARGETING & REMARKETING",
    name: "Meta Pixel Retargeting Audiences",
    description: "Pixel fires on all Nivy pages → build custom audiences: page visitors, blog readers, video viewers, form abandoners. Run retargeting ads with tailored creatives.",
    tools: ["Meta Pixel", "Meta Ads Manager", "Canva"],
    from: "S3",
    to: "S4",
    channel: "Facebook / Instagram",
    type: "inbound",
  },
  {
    id: 30,
    category: "🔄 RETARGETING & REMARKETING",
    name: "Google Display + YouTube Retargeting",
    description: "Website visitors get followed by Nivy display/video ads across Google network. Segment by page visited (service-specific retargeting). 30/60/90 day windows.",
    tools: ["Google Ads", "Google Analytics", "YouTube Ads"],
    from: "S3",
    to: "S4",
    channel: "Google Network",
    type: "inbound",
  },
  {
    id: 31,
    category: "🔄 RETARGETING & REMARKETING",
    name: "Email Re-Engagement Automation",
    description: "Tag cold/inactive leads in CRM → trigger re-engagement sequence: 'We noticed you...', special offer, last-chance email. Remove non-openers to clean list.",
    tools: ["ActiveCampaign", "Mailchimp", "Make.com"],
    from: "S3",
    to: "S4",
    channel: "Email",
    type: "outbound",
  },
  {
    id: 32,
    category: "🔄 RETARGETING & REMARKETING",
    name: "WhatsApp Re-Engagement Broadcast",
    description: "Segment inactive WhatsApp leads → broadcast relevant offer/update → track reply rate → re-qualify interested leads back into active pipeline.",
    tools: ["Wati", "AiSensy", "Make.com"],
    from: "S3",
    to: "S4",
    channel: "WhatsApp",
    type: "outbound",
  },

  // ─── SALES CONVERSION ───
  {
    id: 33,
    category: "💰 SALES CONVERSION AUTOMATION",
    name: "Auto-Booking Discovery Call (Calendly)",
    description: "Every CTA, email, and outreach links to Calendly. Auto-timezone detection, reminder emails + WhatsApp 24h and 1h before. No-show triggers reschedule sequence.",
    tools: ["Calendly", "Make.com", "Wati", "CRM"],
    from: "S4",
    to: "S5",
    channel: "Multi-channel",
    type: "inbound",
  },
  {
    id: 34,
    category: "💰 SALES CONVERSION AUTOMATION",
    name: "AI Proposal Generator",
    description: "Sales rep fills intake form → Claude generates custom proposal PDF in Nivy brand → auto-send via email + WhatsApp with e-sign link → track opens.",
    tools: ["Claude API", "Pandadoc", "Make.com", "HubSpot"],
    from: "S4",
    to: "S5",
    channel: "Email + WhatsApp",
    type: "outbound",
  },
  {
    id: 35,
    category: "💰 SALES CONVERSION AUTOMATION",
    name: "Deal Follow-Up Reminder Automation",
    description: "CRM auto-reminds sales rep if deal hasn't moved in 3 days. Auto-draft follow-up message. Escalate to manager if stuck >7 days. Track deal velocity.",
    tools: ["HubSpot", "Pipedrive", "Slack", "Make.com"],
    from: "S4",
    to: "S5",
    channel: "CRM",
    type: "outbound",
  },
  {
    id: 36,
    category: "💰 SALES CONVERSION AUTOMATION",
    name: "Payment Link + Invoice Automation",
    description: "Deal marked Won → auto-generate invoice (Razorpay/Stripe) → send payment link via email + WhatsApp → payment received → auto-trigger onboarding sequence.",
    tools: ["Razorpay", "Stripe", "Make.com", "Wati"],
    from: "S5",
    to: "S5",
    channel: "Payment",
    type: "inbound",
  },

  // ─── RETENTION & LTV ───
  {
    id: 37,
    category: "🔁 RETENTION, UPSELL & REFERRAL",
    name: "Client Onboarding Automation",
    description: "Payment received → auto-send welcome email + WhatsApp → share onboarding checklist → schedule kickoff call → assign internal team → create project in Notion/Asana.",
    tools: ["Make.com", "Notion", "Wati", "Calendly"],
    from: "S5",
    to: "S6",
    channel: "Multi-channel",
    type: "inbound",
  },
  {
    id: 38,
    category: "🔁 RETENTION, UPSELL & REFERRAL",
    name: "Monthly Report Auto-Generation (Client)",
    description: "Pull data from project tools → Claude generates branded PDF report → auto-send to client on 1st of each month → reinforces value, reduces churn.",
    tools: ["Claude API", "Make.com", "Google Data Studio"],
    from: "S6",
    to: "S6",
    channel: "Email",
    type: "inbound",
  },
  {
    id: 39,
    category: "🔁 RETENTION, UPSELL & REFERRAL",
    name: "Upsell / Cross-Sell Trigger Sequences",
    description: "Client in Education vertical → auto-trigger offer for Digital Solutions after 60 days. Healthcare client → offer Tax services. Rule-based cross-vertical upsell automation.",
    tools: ["HubSpot", "ActiveCampaign", "Make.com"],
    from: "S6",
    to: "S5",
    channel: "Email + WhatsApp",
    type: "outbound",
  },
  {
    id: 40,
    category: "🔁 RETENTION, UPSELL & REFERRAL",
    name: "Review & Testimonial Collection Bot",
    description: "30 days post-service → auto-WhatsApp/email asking for Google review + video testimonial. If positive → share on social. If negative → alert manager for recovery.",
    tools: ["Make.com", "Wati", "Google Business API"],
    from: "S6",
    to: "S1",
    channel: "WhatsApp + Email",
    type: "inbound",
  },
  {
    id: 41,
    category: "🔁 RETENTION, UPSELL & REFERRAL",
    name: "Referral Program Automation",
    description: "Happy client gets unique referral link → tracks referrals in CRM → auto-send reward/discount on successful referral conversion → leaderboard for top referrers.",
    tools: ["ReferralHero", "HubSpot", "Make.com"],
    from: "S6",
    to: "S1",
    channel: "Email + WhatsApp",
    type: "inbound",
  },

  // ─── GROWTH HACKING ───
  {
    id: 42,
    category: "⚡ GROWTH HACKING & UNCONVENTIONAL",
    name: "Competitor SEO Gap Attack",
    description: "Scrape competitor backlinks (Ahrefs) → find sites linking to them but not Nivy → auto-draft outreach emails for link building → track DR improvements monthly.",
    tools: ["Ahrefs", "Claude API", "Lemlist"],
    from: "S1",
    to: "S2",
    channel: "SEO",
    type: "inbound",
  },
  {
    id: 43,
    category: "⚡ GROWTH HACKING & UNCONVENTIONAL",
    name: "LinkedIn Engagement Pod Automation",
    description: "Auto-like/comment on posts within 30 min of publishing from pod members → boosts LinkedIn algorithm reach → more impressions on Nivy content for free.",
    tools: ["Lempod", "Taplio", "PhantomBuster"],
    from: "S1",
    to: "S2",
    channel: "LinkedIn",
    type: "inbound",
  },
  {
    id: 44,
    category: "⚡ GROWTH HACKING & UNCONVENTIONAL",
    name: "HARO / Source Bottle PR Automation",
    description: "Monitor HARO queries in relevant categories → Claude drafts expert pitch → human sends → get featured in media → auto-share coverage on all channels.",
    tools: ["HARO", "Claude API", "Make.com"],
    from: "S1",
    to: "S2",
    channel: "PR / Media",
    type: "inbound",
  },
  {
    id: 45,
    category: "⚡ GROWTH HACKING & UNCONVENTIONAL",
    name: "Job Board Scraper for Recruitment Vertical",
    description: "Scrape Naukri, Indeed, LinkedIn Jobs for companies posting jobs in UP/Lucknow → pitch Nivy's job placement services to their HR. Auto-outreach sequence.",
    tools: ["Apify", "Python", "Instantly.ai"],
    from: "S1",
    to: "S2",
    channel: "Job Boards",
    type: "outbound",
  },
  {
    id: 46,
    category: "⚡ GROWTH HACKING & UNCONVENTIONAL",
    name: "GST / MCA Database Mining",
    description: "Public GST registrant data → filter by category + city → enrich → outreach for tax/accounting services. Legal public data, high-intent B2B leads.",
    tools: ["Python", "Public APIs", "Make.com"],
    from: "S1",
    to: "S2",
    channel: "Government Data",
    type: "outbound",
  },
  {
    id: 47,
    category: "⚡ GROWTH HACKING & UNCONVENTIONAL",
    name: "Viral Giveaway / Contest Automation",
    description: "Run social contest (KingSumo/Gleam) → viral sharing loop → collect emails + phone numbers → enter nurture funnel → announce winner publicly for social proof.",
    tools: ["KingSumo", "Gleam", "ActiveCampaign"],
    from: "S1",
    to: "S2",
    channel: "Social Media",
    type: "inbound",
  },
  {
    id: 48,
    category: "⚡ GROWTH HACKING & UNCONVENTIONAL",
    name: "AI SDR Agent (Full Autonomous Outreach)",
    description: "Fully autonomous agent: scrapes leads → enriches → writes personalized email → sends → tracks replies → classifies interested/not → books meeting. Zero human touch.",
    tools: ["n8n", "Clay.com", "Claude API", "Instantly.ai"],
    from: "S1",
    to: "S4",
    channel: "Email + LinkedIn",
    type: "outbound",
  },
];

const categories = [...new Set(automations.map(a => a.category))];
const channelTypes = ["All", "outbound", "inbound"];

export default function App() {
  const [activeCategory, setActiveCategory] = useState("All");
  const [activeType, setActiveType] = useState("All");
  const [expanded, setExpanded] = useState(null);
  const [activeStage, setActiveStage] = useState(null);

  const filtered = automations.filter(a => {
    const catMatch = activeCategory === "All" || a.category === activeCategory;
    const typeMatch = activeType === "All" || a.type === activeType;
    const stageMatch = !activeStage || a.from === activeStage || a.to === activeStage;
    return catMatch && typeMatch && stageMatch;
  });

  const stageColor = (id) => stages.find(s => s.id === id)?.color || "#888";

  return (
    <div style={{
      fontFamily: "'IBM Plex Mono', monospace",
      background: "#0A0A0A",
      color: "#E8E8E0",
      minHeight: "100vh",
      padding: "0",
    }}>
      <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Mono:wght@300;400;600;700&family=Syne:wght@700;800&display=swap" rel="stylesheet" />

      {/* HEADER */}
      <div style={{
        background: "linear-gradient(135deg, #0A0A0A 0%, #1A0A00 100%)",
        borderBottom: "1px solid #FF6B35",
        padding: "40px 32px 32px",
      }}>
        <div style={{ maxWidth: 1200, margin: "0 auto" }}>
          <div style={{ display: "flex", alignItems: "center", gap: 16, marginBottom: 8 }}>
            <div style={{
              background: "#FF6B35",
              color: "#000",
              fontFamily: "'Syne', sans-serif",
              fontWeight: 800,
              fontSize: 11,
              letterSpacing: 3,
              padding: "4px 10px",
            }}>NIVY</div>
            <div style={{ color: "#666", fontSize: 11, letterSpacing: 2 }}>GROWTH OPERATIONS</div>
          </div>
          <h1 style={{
            fontFamily: "'Syne', sans-serif",
            fontWeight: 800,
            fontSize: "clamp(28px, 5vw, 52px)",
            color: "#FFFFFF",
            margin: "0 0 8px",
            lineHeight: 1.1,
          }}>COMPLETE SALES FUNNEL<br /><span style={{ color: "#FF6B35" }}>AUTOMATION MASTER PLAN</span></h1>
          <p style={{ color: "#888", fontSize: 13, margin: 0 }}>
            {automations.length} AUTOMATIONS · OUTBOUND + INBOUND · ALL CHANNELS · AWARENESS → REVENUE → LTV
          </p>
        </div>
      </div>

      {/* FUNNEL STAGES */}
      <div style={{ background: "#111", borderBottom: "1px solid #222", padding: "20px 32px" }}>
        <div style={{ maxWidth: 1200, margin: "0 auto" }}>
          <div style={{ fontSize: 10, letterSpacing: 3, color: "#555", marginBottom: 12 }}>FILTER BY FUNNEL STAGE</div>
          <div style={{ display: "flex", gap: 8, flexWrap: "wrap" }}>
            <button onClick={() => setActiveStage(null)} style={{
              background: !activeStage ? "#FF6B35" : "transparent",
              color: !activeStage ? "#000" : "#666",
              border: "1px solid " + (!activeStage ? "#FF6B35" : "#333"),
              padding: "6px 14px",
              fontSize: 11,
              letterSpacing: 1,
              cursor: "pointer",
              fontFamily: "'IBM Plex Mono', monospace",
            }}>ALL STAGES</button>
            {stages.map(s => (
              <button key={s.id} onClick={() => setActiveStage(activeStage === s.id ? null : s.id)} style={{
                background: activeStage === s.id ? s.color : "transparent",
                color: activeStage === s.id ? "#000" : s.color,
                border: "1px solid " + s.color,
                padding: "6px 14px",
                fontSize: 11,
                letterSpacing: 1,
                cursor: "pointer",
                fontFamily: "'IBM Plex Mono', monospace",
                fontWeight: activeStage === s.id ? 700 : 400,
              }}>
                {s.id} · {s.label}
              </button>
            ))}
          </div>
        </div>
      </div>

      {/* FILTERS */}
      <div style={{ background: "#0D0D0D", borderBottom: "1px solid #1A1A1A", padding: "16px 32px" }}>
        <div style={{ maxWidth: 1200, margin: "0 auto", display: "flex", gap: 32, flexWrap: "wrap" }}>
          <div>
            <div style={{ fontSize: 10, letterSpacing: 3, color: "#444", marginBottom: 8 }}>DIRECTION</div>
            <div style={{ display: "flex", gap: 6 }}>
              {channelTypes.map(t => (
                <button key={t} onClick={() => setActiveType(t)} style={{
                  background: activeType === t ? "#FF6B35" : "#1A1A1A",
                  color: activeType === t ? "#000" : "#888",
                  border: "none",
                  padding: "5px 12px",
                  fontSize: 10,
                  letterSpacing: 1,
                  cursor: "pointer",
                  fontFamily: "'IBM Plex Mono', monospace",
                  textTransform: "uppercase",
                }}>{t}</button>
              ))}
            </div>
          </div>
          <div>
            <div style={{ fontSize: 10, letterSpacing: 3, color: "#444", marginBottom: 8 }}>CATEGORY</div>
            <div style={{ display: "flex", gap: 6, flexWrap: "wrap" }}>
              <button onClick={() => setActiveCategory("All")} style={{
                background: activeCategory === "All" ? "#FF6B35" : "#1A1A1A",
                color: activeCategory === "All" ? "#000" : "#888",
                border: "none",
                padding: "5px 12px",
                fontSize: 10,
                letterSpacing: 1,
                cursor: "pointer",
                fontFamily: "'IBM Plex Mono', monospace",
              }}>ALL</button>
              {categories.map(c => {
                const short = c.split("·")[1]?.trim().split(" ").slice(0,3).join(" ") || c;
                return (
                  <button key={c} onClick={() => setActiveCategory(activeCategory === c ? "All" : c)} style={{
                    background: activeCategory === c ? "#FF6B35" : "#1A1A1A",
                    color: activeCategory === c ? "#000" : "#888",
                    border: "none",
                    padding: "5px 12px",
                    fontSize: 10,
                    letterSpacing: 1,
                    cursor: "pointer",
                    fontFamily: "'IBM Plex Mono', monospace",
                  }}>{short}</button>
                );
              })}
            </div>
          </div>
        </div>
      </div>

      {/* RESULTS COUNT */}
      <div style={{ maxWidth: 1200, margin: "0 auto", padding: "16px 32px 8px" }}>
        <div style={{ fontSize: 11, color: "#555", letterSpacing: 2 }}>
          SHOWING {filtered.length} OF {automations.length} AUTOMATIONS
        </div>
      </div>

      {/* AUTOMATION CARDS */}
      <div style={{ maxWidth: 1200, margin: "0 auto", padding: "8px 32px 60px" }}>
        {categories.filter(c => activeCategory === "All" || activeCategory === c).map(cat => {
          const catItems = filtered.filter(a => a.category === cat);
          if (!catItems.length) return null;
          return (
            <div key={cat} style={{ marginBottom: 40 }}>
              <div style={{
                display: "flex",
                alignItems: "center",
                gap: 12,
                marginBottom: 16,
                paddingBottom: 10,
                borderBottom: "1px solid #1E1E1E",
              }}>
                <div style={{
                  fontSize: 11,
                  letterSpacing: 2,
                  color: "#FF6B35",
                  fontWeight: 600,
                }}>{cat}</div>
                <div style={{
                  background: "#1A1A1A",
                  color: "#666",
                  fontSize: 10,
                  padding: "2px 8px",
                  letterSpacing: 1,
                }}>{catItems.length} AUTOMATIONS</div>
              </div>

              <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(340px, 1fr))", gap: 12 }}>
                {catItems.map(a => (
                  <div key={a.id}
                    onClick={() => setExpanded(expanded === a.id ? null : a.id)}
                    style={{
                      background: expanded === a.id ? "#151515" : "#111",
                      border: expanded === a.id ? "1px solid #FF6B35" : "1px solid #1E1E1E",
                      padding: "16px",
                      cursor: "pointer",
                      transition: "all 0.15s",
                    }}>
                    {/* Card Header */}
                    <div style={{ display: "flex", justifyContent: "space-between", alignItems: "flex-start", marginBottom: 8 }}>
                      <div style={{
                        background: "#1A1A1A",
                        color: "#666",
                        fontSize: 9,
                        padding: "2px 6px",
                        letterSpacing: 2,
                      }}>#{String(a.id).padStart(2,"0")}</div>
                      <div style={{
                        background: a.type === "outbound" ? "#1A0A00" : "#001A0A",
                        color: a.type === "outbound" ? "#FF6B35" : "#88D498",
                        fontSize: 9,
                        padding: "2px 6px",
                        letterSpacing: 2,
                        textTransform: "uppercase",
                      }}>{a.type}</div>
                    </div>

                    <div style={{ fontSize: 14, fontWeight: 600, color: "#F0F0E8", marginBottom: 8, lineHeight: 1.3 }}>
                      {a.name}
                    </div>

                    {/* Stage Flow */}
                    <div style={{ display: "flex", alignItems: "center", gap: 6, marginBottom: 10 }}>
                      <span style={{
                        background: stageColor(a.from) + "22",
                        color: stageColor(a.from),
                        fontSize: 9,
                        padding: "2px 8px",
                        letterSpacing: 1,
                        border: "1px solid " + stageColor(a.from) + "44",
                      }}>{a.from}</span>
                      <span style={{ color: "#444", fontSize: 10 }}>→</span>
                      <span style={{
                        background: stageColor(a.to) + "22",
                        color: stageColor(a.to),
                        fontSize: 9,
                        padding: "2px 8px",
                        letterSpacing: 1,
                        border: "1px solid " + stageColor(a.to) + "44",
                      }}>{a.to}</span>
                      <span style={{ marginLeft: "auto", color: "#444", fontSize: 9, letterSpacing: 1 }}>
                        {a.channel}
                      </span>
                    </div>

                    {expanded === a.id && (
                      <>
                        <div style={{
                          fontSize: 12,
                          color: "#AAA",
                          lineHeight: 1.6,
                          marginBottom: 12,
                          paddingTop: 8,
                          borderTop: "1px solid #1E1E1E",
                        }}>{a.description}</div>
                        <div style={{ display: "flex", gap: 6, flexWrap: "wrap" }}>
                          {a.tools.map(t => (
                            <span key={t} style={{
                              background: "#0A0A0A",
                              border: "1px solid #2A2A2A",
                              color: "#888",
                              fontSize: 9,
                              padding: "3px 8px",
                              letterSpacing: 1,
                            }}>{t}</span>
                          ))}
                        </div>
                      </>
                    )}
                  </div>
                ))}
              </div>
            </div>
          );
        })}
      </div>

      {/* LEGEND */}
      <div style={{
        background: "#0D0D0D",
        borderTop: "1px solid #1A1A1A",
        padding: "24px 32px",
      }}>
        <div style={{ maxWidth: 1200, margin: "0 auto" }}>
          <div style={{ fontSize: 10, letterSpacing: 3, color: "#444", marginBottom: 12 }}>FUNNEL STAGE LEGEND</div>
          <div style={{ display: "flex", gap: 16, flexWrap: "wrap" }}>
            {stages.map(s => (
              <div key={s.id} style={{ display: "flex", alignItems: "center", gap: 8 }}>
                <div style={{ width: 8, height: 8, background: s.color }} />
                <span style={{ fontSize: 10, color: "#666", letterSpacing: 1 }}>
                  {s.id} · {s.label} <span style={{ color: "#444" }}>({s.short})</span>
                </span>
              </div>
            ))}
          </div>
        </div>
      </div>
    </div>
  );
}
```