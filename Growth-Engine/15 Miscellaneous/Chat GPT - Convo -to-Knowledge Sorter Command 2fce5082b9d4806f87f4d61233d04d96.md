# Chat GPT - Convo -to-Knowledge Sorter Command

- Command for ChatGPT Conversations
    
    ```c
    Act as my Enterprise Knowledge Base Architect for **any conversation length**, including very long chats.
    
    ---
    
    INSTRUCTIONS:
    
    1️⃣ **Preprocessing**
    
    - If the conversation is too long to process at once, split it into logical sections (chunks).
    - Each chunk should contain a manageable number of messages for AI context limits.
    - Process each chunk individually to ensure no content is truncated.
    
    2️⃣ **Analysis**
    
    - For each chunk, identify the correct **Department** and **Sub-Department** from the full enterprise taxonomy below.
    - Create multiple topics if needed.
    - Assign a **clear title** for each topic using the format:
    [Department] → [Sub-Department] → [Specific Topic]
    - Use the taxonomy for guidance, but allow the AI to infer specific topics from content.
    
    3️⃣ **Output Structure per TopicDATABASE FIELDS:**
    
    - Department
    - Sub-Department
    - Topic Type
    - Tags (max 7)
    - Keywords
    - Status
    - Owner
    
    **PAGE CONTENT:**
    
    - One-Line Summary
    - Key Points
    - How the Company Uses This
    - Action Items
    - Notes / Open Questions
    
    4️⃣ **Postprocessing / Merging**
    
    - After processing all chunks:
        - Merge all outputs into a single structured KB.
        - Remove duplicates.
        - Ensure enterprise-style language.
        - Clean markdown.
        - Notion-ready.
    - Output only the final structured content. Remove all conversational text.
    
    ---
    
    5️⃣ **Full Enterprise Taxonomy Reference**
    
    **1️⃣ Strategy**
    
    - Corporate Strategy: Market positioning, Moat & differentiation, Long-term planning, SWOT/Porter/Blue Ocean
    - Business Model: Revenue streams, Pricing models, Monetization strategies
    - Competitive Intelligence: Competitor analysis, Benchmarking, Market share
    - Vision & OKRs: Company vision, OKRs, Strategic milestones
    
    **2️⃣ Sales**
    
    - B2B Sales: Lead generation, Pipeline management, Account-based selling
    - B2C Sales: Customer acquisition, Retail strategy, Sales funnels
    - Sales Operations: CRM processes, Forecasting, Reporting
    - Sales Enablement: Pitch frameworks, Objection handling, Sales content
    
    **3️⃣ Growth Engine**
    
    - Growth Strategy: AARRR funnel, Scaling channels
    - Funnel Optimization: Conversion optimization, Retention
    - Retention & LTV: Loyalty programs, Customer lifetime value
    - Experiments & Testing: A/B testing, Growth experiments
    
    **4️⃣ Marketing**
    
    - Brand Marketing: Brand identity, Positioning, Storytelling
    - Content Marketing: Blogs, Video, Social content strategy
    - Digital Marketing: SEO (On-page, Off-page, Technical), SMM (Instagram, YouTube, LinkedIn), Paid Ads (Google, Meta), Email & Automation, Influencer Marketing
    - Performance Marketing: Paid media, ROI analysis, Attribution
    
    **5️⃣ Lead Generation**
    
    - Organic Leads: SEO, Content funnels
    - Paid Leads: Ads, Retargeting
    - Partnership Leads: Affiliates, Co-marketing
    
    **6️⃣ Operations**
    
    - Process Management: Workflows, SOPs
    - SOPs: Documentation, Standardization
    - Quality Control: QA processes, KPIs
    - Vendor Management: Supplier onboarding, Contracts
    
    **7️⃣ Product / Services**
    
    - Product Strategy: Roadmaps, Market fit
    - Service Design: Customer journey, Experience mapping
    - Pricing & Packaging: Offer creation, Value proposition
    - Customer Experience: Feedback loops, NPS, Support systems
    
    **8️⃣ Research & Insights**
    
    - Market Research: Industry trends, Market sizing
    - User Research: Personas, Surveys, Interviews
    - Trend Analysis: Consumer psychology, Emerging trends
    
    **9️⃣ Legal & Compliance**
    
    - Company Law: Registration, Structure
    - Industry Regulations: Licensing, Compliance
    - Contracts & IP: NDAs, IP management
    
    **🔟 Finance**
    
    - Financial Planning: Forecasting, Budgets
    - Budgeting: Department budgets, Allocation
    - Cash Flow: Inflow/outflow, Liquidity
    
    **1️⃣1️⃣ Accounting**
    
    - Bookkeeping: Transaction tracking, Ledgers
    - Taxation: GST/VAT, Filing
    - Audits: Internal/External, Compliance
    
    **1️⃣2️⃣ Human Resources (HR)**
    
    - Hiring & Recruitment: JD frameworks, Sourcing, Interviews
    - Performance Management: Appraisals, KPIs, OKRs
    - Culture & Policies: Employee handbook, HR compliance
    
    **1️⃣3️⃣ Partners**
    
    - Delivery Partners: Onboarding, SLAs
    - Sales Partners: Revenue sharing, Co-selling
    - Technology Partners: Integrations, API management
    
    **1️⃣4️⃣ Suppliers & Vendors**
    
    - Supplier Management: Evaluation, Relationship
    - Procurement: Cost negotiation, Contracts
    
    **1️⃣5️⃣ IT & Systems**
    
    - Infrastructure: Servers, Cloud, Networks
    - Security: Data protection, Access control
    - Internal Tools: Automation, SaaS stack
    
    ---
    
    ✅ **Rules**
    
    - Always generate **Notion-ready, enterprise-style structured output**.
    - Remove all conversational text.
    - Ensure clean markdown and consistent formatting.
    - Automatically handle any conversation length.
    ```
    
- Command for Notion to MS Word File to Structured Data

[Chat GPT Convo to Knowledge command 1.1](Chat%20GPT%20Convo%20to%20Knowledge%20command%201%201%202fce5082b9d480468293c1172fd739dd.md)

[Commands](Commands%202fce5082b9d480999145ebb514edcf54.md)