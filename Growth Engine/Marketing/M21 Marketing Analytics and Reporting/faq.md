# M21 — Marketing Analytics and Reporting: FAQ

**Q: Do we need one GA4 property or one per brand (Nivy Academy, Nivy Next, etc.)?**
One per brand/domain. A shared property blends traffic across unrelated brands and makes channel performance unreadable for any single one.

**Q: Is pixel/ad tracking (21B) needed even though Track M is organic-channel focused?**
Only once a paid channel is actually running (a future paid-ads effort, or paid amplification of an M18 experiment). For a purely organic Track M, 21A (GA4 + Search Console + goals) is the required baseline; 21B is conditional.

**Q: What's the actual difference between the weekly snapshot and the monthly rollup?**
Weekly is operational — did anything change that needs attention this week. Monthly is a business-level decision point — which channel/content pillar to invest more in, which M18 experiments to keep or kill.

**Q: Why does this stage own UTM tagging instead of each social/content stage (M09-M17) owning its own?**
Each stage applies the tag to its own links, but the naming convention itself has to be centralized here — if M11 (LinkedIn) and M17 (Newsletter) invent their own UTM conventions independently, the dashboard this stage builds can't compare them.

**Q: How do we know M21's lead-by-source numbers and M22's CRM entry counts are actually in sync?**
They're cross-checked in the monthly rollup and in M22's weekly checklist — a mismatch between the two is the fastest signal that a webhook broke or a UTM tag went missing.
