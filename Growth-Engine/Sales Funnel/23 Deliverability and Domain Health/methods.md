# Methods — 23 Deliverability and Domain Health

[⬅ Back to README](README.md)

## Traditional
Manually checking each mailbox/number's stats dashboard periodically.

## Modern / Tool-Assisted
Centralized monitoring tools (Google Postmaster Tools, MXToolbox, sequencer-native deliverability dashboards) checked on a fixed schedule.

## AI-Assisted
LLM-summarized daily health reports across many identities, flagging what needs human attention.

## Manual
Incident response decisions (pause, rotate, retire) always require human judgment given campaign impact.

## Automated
Scheduled daily/weekly pulls of bounce/complaint/blacklist data from each channel tool's API.

## API / Integration
Channel tool APIs (Stage 16-19) feeding a centralized health-tracking sheet or dashboard.

## Browser Automation
Not typically needed; most monitoring tools expose data via dashboard or API directly.

## Scraping
Not applicable to this stage.

## Public Database / Government
Blacklist-checking services (e.g., MXToolbox) query public DNS-based blacklists (DNSBLs) as part of domain/IP health checks.

## Community / Referral
Not applicable to this stage.

## Method Selection Guidance
Automate the data-pull layer fully; keep the pause/rotate/retire decision manual, since it affects live campaigns and warrants human judgment on severity and timing.
