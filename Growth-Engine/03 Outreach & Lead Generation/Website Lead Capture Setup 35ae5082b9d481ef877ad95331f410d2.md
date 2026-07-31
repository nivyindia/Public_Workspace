# Website Lead Capture Setup

**Owner:** Nivy Digital Founder | **Status:** 🟢 Complete | **Last Updated:** May 2026 | **Section:** SD-03 Lead Generation

**Tags:** `website` `lead-capture` `forms` `HubSpot` `Cal.com` `SD-03`

---

> 🎯 **Purpose:** Everything needed to set up website lead capture — forms, booking widgets, chatbots, and integrations — so no visitor leaves without an action being tracked.
> 

---

# 📌 Quick Navigation

- [Lead Capture Points](#capture-points)
- [Form Setup (HubSpot)](#forms)
- [Booking Widget (](#booking)[Cal.com](http://Cal.com)[)](#booking)
- [Exit Intent Popup](#popup)
- [Tracking & Reporting](#tracking)

---

# 🎯 Lead Capture Points on the Website {#capture-points}

| Location | Capture Type | CTA |
| --- | --- | --- |
| Homepage hero | Form or CTA button | “Book a Free 30-Min Call” |
| Homepage mid-section | Lead magnet offer | “Download Free Checklist” |
| Services pages | Inline CTA | “Get a Free Quote” |
| Blog posts | Inline + end of post | “Want help with this? Talk to us.” |
| About page | CTA button | “Work With Us” |
| Contact page | Full contact form | Name, email, message, service interest |
| Exit intent popup | Popup trigger | “Before you go — grab our free checklist” |
| Header (sticky nav) | Button | “Book a Call” |
| Footer | Email capture | Newsletter signup |

---

# 📝 Form Setup (HubSpot) {#forms}

## Standard Lead Form Fields

- First Name (required)
- Last Name (required)
- Email (required)
- Company Name (required)
- Country (dropdown: US / UK / UAE / AU / India / Other)
- Service Interest (dropdown: Advisory / IT & Tech / Marketing / VA Program / All of the above)
- Message (optional free text)

## Setup Steps

1. Go to HubSpot → Marketing → Forms → Create Form
2. Choose embedded form type
3. Add the fields above
4. Set redirect to a "Thank You" page after submission
5. Enable auto-notification email to founder when form submitted
6. Enable auto-reply email to the lead (welcome + next steps)
7. Copy embed code and paste into your website

## Thank You Page

- Message: "Thanks! We’ll be in touch within 1 business day. In the meantime, book a call directly:"
- Embed [Cal.com](http://Cal.com) booking widget on the thank-you page for instant conversion

---

# 📅 Booking Widget ([Cal.com](http://Cal.com)) {#booking}

## Setup Steps

1. Create account at [cal.com](http://cal.com) (free)
2. Create event type: **"30-Min Discovery Call — Nivy Digital"**
3. Set availability: Mon–Fri, 10am–4pm IST (or market-specific hours)
4. Add intake questions:
    - What’s your business about?
    - What service are you interested in?
    - Which country are you based in?
5. Connect Google Calendar (auto-blocks conflicts)
6. Set confirmation email with Zoom/Meet link
7. Embed on: Contact page, Book a Call page, Thank You page, email footer

## Embed Code

```html
<!-- Cal.com inline embed -->
<div style="width:100%;height:100%;overflow:scroll" id="my-cal-inline"></div>
<script type="text/javascript">
  (function (C, A, L) { ... })(window, document, "https://app.cal.com/embed/embed.js");
  Cal("inline", { elementOrSelector: "#my-cal-inline", calLink: "nivy-digital/discovery" });
</script>
```

---

# 🔗 Exit Intent Popup {#popup}

**Trigger:** When user moves mouse toward browser close/back button

**Tool:** Tidio popup / ConvertBox / OptinMonster

**Template:**

> **"Wait — before you go!"**
> 

> Download our free [Lead Magnet Title] and learn how to [key benefit].
> 

> [Email field] [Download Now button]
> 

**Rule:** Only show once per visitor per 30 days. Never on the booking confirmation page.

---

# 📊 Tracking & Reporting {#tracking}

| What to Track | Tool | Check Frequency |
| --- | --- | --- |
| Form submissions | HubSpot | Daily |
| Call bookings | [Cal.com](http://Cal.com) | Daily |
| Lead source attribution | HubSpot / GA4 | Weekly |
| Form conversion rate | GA4 (event tracking) | Weekly |
| Exit popup conversion rate | Tidio / OptinMonster | Weekly |

**Target conversion rates:**

- Homepage CTA → form submission: 3–5%
- Form submission → call booked: 40%+
- Exit popup → email capture: 5–10%

---

📋 **PAGE METADATA**

- **Section:** SD-03 — Lead Generation & Data
- **Parent:** 🎣 SD-03 Hub
- **Status:** 🟢 Complete | **Last Updated:** May 2026
- **Tags:** `website` `lead-capture` `forms` `HubSpot` `Cal.com` `SD-03`