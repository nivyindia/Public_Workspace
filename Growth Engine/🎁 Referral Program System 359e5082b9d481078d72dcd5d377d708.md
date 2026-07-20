# 🎁 Referral Program System

**Parent:** 🚀 SD-06 Growth | **Owner:** Nivy Digital Founder | **Status:** ⬜ Todo | **Updated:** May 2026

**Tags:** `referrals` `program` `incentive` `growth` `automation` `SD-06`

---

> 🎯 **Purpose:** The complete design and operating system for Nivy Digital's client referral program — structure, incentives, automation, and tracking.
> 

---

# 📌 QUICK NAVIGATION

- [Program Structure](#structure)
- [Incentive Options](#incentives)
- [Referral Flow & Automation](#flow)
- [Referral Email Templates](#templates)
- [Launch Checklist](#launch)
- [Tracking](#tracking)

---

# 🏗️ PROGRAM STRUCTURE {#structure}

## How It Works

1. Client completes first month with Nivy Digital ✅
2. n8n triggers a referral invitation email automatically
3. Client shares their unique referral link or introduces a contact directly
4. When referred contact signs a contract, referrer gets rewarded
5. Reward delivered within 7 days of referred client's first payment

## Referral Types

| Type | Who Can Refer | Reward |
| --- | --- | --- |
| Client referral | Active Nivy clients | 10% of first month's value |
| Partner referral | Agencies, consultants, web devs | 15% of first month's value |
| Cold referral | Anyone with a network | 10% of first month's value |

---

# 🎁 INCENTIVE OPTIONS {#incentives}

## Recommended: Cash + Service Credits

| Referred Contract Value | Cash Reward | Alternative |
| --- | --- | --- |
| $500–$999/month | $75 cash (or $100 service credit) | 1 month of VA add-on hours |
| $1,000–$2,999/month | $150 cash (or $200 service credit) | 1 extra service month |
| $3,000+/month | $300 cash (or $400 service credit) | Custom reward |

## Payment Method

- India: Bank transfer or UPI
- International: PayPal or Wise

---

# 🔄 REFERRAL FLOW & AUTOMATION {#flow}

```
Deal Closed Won in HubSpot
        ↓
n8n trigger: Deal moved to "Closed Won"
        ↓
Wait 30 days (client completes onboarding)
        ↓
n8n sends: Referral Invitation Email (Template A)
        ↓
Client shares referral link / intro email
        ↓
New contact books call → mentions referrer
        ↓
Sales rep notes referrer in HubSpot (custom property: "Referred By")
        ↓
New deal Closed Won → n8n triggers reward payment email
        ↓
Founder approves → reward sent within 7 days
```

## HubSpot Properties Needed

- Contact: "Referred By" (text field)
- Deal: "Referral Source" (dropdown: Direct / Referral / Partner / Directory)
- Contact: "Is Referral Partner?" (checkbox)

---

# 📧 REFERRAL EMAIL TEMPLATES {#templates}

## Template A — Referral Invitation (Month 1 Trigger)

```
Subject: A little thank-you — and an offer for you, [Name]

Hi [Name],

You've been amazing to work with — thank you for trusting us!

We're growing through referrals and would love your help.

If you know anyone who could benefit from a dedicated VA 
or digital marketing support, we'll reward you:

✅ $100–$300 cash (depending on the contract value)
for every person you refer who signs with us.

Here's your referral link: [unique link]
Or just forward this email to someone who comes to mind!

Thanks again for being an awesome client.

— Abhi, Nivy Digital
```

## Template B — Referral Thank You (after successful referral)

```
Subject: Your referral reward is on the way! 🎉

Hi [Name],

[Referred Name] just signed up with us — and it's all thanks to you!

Your reward of [$X] is being processed and will be sent to 
[PayPal/bank details] within 7 days.

Thank you so much. Referrals like yours mean the world to us.

Don't hesitate to reach out if there's anything we can do for you!

— Abhi, Nivy Digital
```

---

# ✅ LAUNCH CHECKLIST {#launch}

- [ ]  Referral link system set up (can use simple [Bit.ly](http://Bit.ly) links with tracking initially)
- [ ]  HubSpot properties: "Referred By" + "Referral Source" added
- [ ]  n8n workflow built: Closed Won → 30-day delay → referral email
- [ ]  Referral landing page created (or simple email response flow)
- [ ]  Template A and B written and loaded into Brevo
- [ ]  Payment method confirmed (PayPal/Wise/UPI)
- [ ]  Announce program to all existing clients in first broadcast

---

# 📊 TRACKING {#tracking}

| Metric | Monthly Target |
| --- | --- |
| Referral invitations sent | = all active clients |
| Referrals received | 1+ per month |
| Referral conversion rate | >30% |
| Revenue from referrals | 10% of total Month 3, 25% Month 6 |
| Active referral partners | 3 by Month 6 |

---

📋 **PAGE METADATA**

- **Section:** SD-06 Growth Engine
- **Parent:** 🚀 SD-06 Hub
- **Status:** ⬜ Todo
- **Last Updated:** May 2026
- **Tags:** `referrals` `program` `incentive` `automation` `growth` `SD-06` `nivy-digital`
- **Related Pages:** SD-08 Automation | SD-09 Targets & CRM | SD-07 Sales Conversion

---