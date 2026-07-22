# M09 — FAQ

**Q: Can an AI-drafted post ever skip human review?**
No. This is a standing rule across Track M (see Implementation Plan §6), not a suggestion — every AI-assisted or AI-automated draft goes through the full review gate in `checklists.md` before publish, no exceptions for time pressure.

**Q: Which method should I default to if I'm not sure?**
Start with Method 2 (free-tool-assisted manual) for standard blog posts. Reserve Method 1 (fully manual) for pillar pages, founder voice, and anything legally sensitive. Move to Method 3/4 only once volume genuinely requires it — see the table in `methods.md`.

**Q: What if M04 (Keyword Research) or M08 (Editorial Calendar) aren't built yet?**
M09 can still run — pull keywords manually from Google Keyword Planner/Trends and track the brief in a simple spreadsheet — but note this as a temporary workaround and re-wire to M04/M08 once those stages are built, per the cross-reference notes in `README.md`.

**Q: Do we need a paid AI API to run this stage?**
No. The free Claude.ai/ChatGPT UI tier covers Methods 3 and most of Tier 3 automation. A paid API is only needed if you want the *fully automated* Tier 4 n8n workflow to call the drafting step without a human copy-pasting into a chat UI — see the note in `automation.md`.

**Q: How do we handle claims we can't verify (stats, case studies, tool comparisons)?**
Don't publish them. Per the standing rule in the Implementation Plan, no fabricated stats, tools, or case studies — if research turns up nothing citable, the piece says so or the section is cut, rather than inventing detail.

**Q: Where does SEO implementation happen — here or in M05?**
M09 owns the writing and a basic on-page pass (title, meta description, headers) as part of the pre-publish checklist. M05 (On-Page SEO Implementation) owns the deeper technical on-page work (schema, structured data, internal linking architecture at the site level). The two stages hand off rather than duplicate.
