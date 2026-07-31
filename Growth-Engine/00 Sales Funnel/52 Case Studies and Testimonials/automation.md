# Automation — 52 Case Studies and Testimonials

[⬅ Back to README](README.md)

## Manual
Client approval of final case study/testimonial wording — always required before publishing.

## Semi-Automated
AI drafts a case study from raw delivery notes/metrics; a team member reviews and sends to the client for approval.

## Full-Automated
The testimonial-ask trigger (message sent to the client) can fire automatically off a promoter-flagged NPS response or milestone-completion event.

## AI-Assisted Workflow
1. Stage 51 flags a promoter account, or a milestone-completion event fires.
2. Automated testimonial-ask message sends via WhatsApp/email (see [templates.md](templates.md)).
3. If the client responds with informal positive feedback, AI formats it into a polished quote.
4. Client approves final wording.
5. Approved testimonial/case study added to the library, tagged by industry/client type, available for Stage 31/33.

## Suggested n8n / integration flow
`Stage 51 (promoter flagged) OR milestone completion` → `n8n (send testimonial-ask message)` → `Client response` → `LLM API (format into polished quote)` → `Client approval` → `Library (Notion/CRM) updated` → `Available to Stage 31/33`
