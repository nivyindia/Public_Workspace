# Methods — 38 Deal Desk and Approval Workflows

[⬅ Back to README](README.md)

## Traditional
A rep emails a manager directly asking "can I approve this discount?" with no record of the decision beyond the email thread.

## Modern / Tool-Assisted
A structured deal-desk request logged in the CRM (HubSpot deal properties / a dedicated "Approval Requested" pipeline stage) that routes to the correct approver based on discount size or term type.

## AI-Assisted
An LLM pre-screens the deal-desk request against policy (discount %, payment-term deviation, scope change) and flags which approval tier applies before a human ever looks at it, reducing back-and-forth.

## Manual
Final approval decision is always a named human — this stage is a control gate, not something that should be fully automated away, even when routing and flagging are automated.

## Automated
Auto-routing of requests to the correct approver tier based on rule thresholds (e.g., discount ≤10% → Account Manager; 11–20% → Founder; >20% → escalation).

## API / Integration
CRM deal-stage change ⇄ approval-request webhook ⇄ Slack/Telegram/WhatsApp notification to the correct approver, closing the loop back into the CRM once a decision is made.

## Browser Automation
Not applicable to this stage.

## Scraping
Not applicable to this stage.

## Public Database / Government
Not applicable to this stage.

## Community / Referral
Not applicable to this stage.

## Method Selection Guidance
Use CRM-native approval fields for teams already living in HubSpot; use a lightweight Slack/Telegram approval workflow for smaller teams where a dedicated CRM approval pipeline is overkill. Either way, the underlying rule (named approver, logged decision) matters more than the specific tool.
