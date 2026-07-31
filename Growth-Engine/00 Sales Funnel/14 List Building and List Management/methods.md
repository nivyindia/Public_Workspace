# 14 List Building and List Management — Methods

[⬅ Back to README](README.md)

---

## Manual

**Manual export by filter** — CRM owner filters contacts by segment + status, reviews the resulting count and sample rows, then exports/tags the list for a campaign. Suitable at low volume/campaign frequency.

## Semi-Automated

**Dynamic/smart lists** — CRM-native saved filters that auto-populate as records match criteria, removing the need to rebuild a static export every time. Best for evergreen segments (e.g., "all Hot-tier US Founders") that continuously feed ongoing outreach rather than one-off campaigns.

**Suppression-check automation** — before a list is marked Active, an automation cross-references it against the suppression list (unsubscribes, bounces, opt-outs, existing customers) and strips matches automatically, logging what was removed.

## Fully Automated

**Trigger-based list assembly** — a new lead crossing into a given segment + tier combination is automatically added to the relevant active outreach list without any manual list-build step, common in CRMs with native workflow automation.

## AI-Assisted

**Near-duplicate detection** — an LLM or fuzzy-matching pass reviews a proposed list against active lists/suppression list for near-duplicates that exact-match logic misses (e.g., "Acme Inc." vs "Acme Incorporated," personal vs. work email for the same person).

**List composition review** — an LLM summarizes a built list's persona/geography/tier mix in plain language, helping a campaign owner sanity-check the list before send without manually pivoting the data.

## Method Selection Guide

| Situation | Recommended method |
|---|---|
| One-off campaign, small volume | Manual export by filter |
| Evergreen/ongoing outreach segment | Dynamic/smart list |
| Any list before it goes Active | Suppression-check automation (mandatory, not optional) |
| High campaign frequency across many segments | Trigger-based list assembly |
| Merging lists from multiple sources/campaigns | AI-assisted near-duplicate detection |

[⬅ Back to README](README.md) · [Next: tools.md](tools.md)
