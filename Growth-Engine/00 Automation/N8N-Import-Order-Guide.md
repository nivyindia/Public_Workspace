# n8n me Star Topology Import Karne ka Order

Sab workflows (Hub + saare spokes) **ek hi n8n instance/project** me import karne honge. Wajah: `Execute Workflow` node ka `workflowId` reference sirf **same n8n instance** ke andar kaam karta hai — Hub-Intake ya kisi spoke ka ID doosre project/instance se refer nahi ho sakta.

Order isliye matter karta hai kyunki dependency dono taraf se hai: har spoke ko Hub-Intake ka ID chahiye, aur Hub-Dispatcher ko har spoke ka ID chahiye.

---

## Step 1 — Migrations run karo pehle

`master-migrations` SQL (`funnel_events`, `flagged_events`, aur sab per-module `ALTER TABLE`s) ek baar Postgres par run karo. Hub aur spokes dono inhi tables par depend karte hain.

## Step 2 — Hub-Intake import + Active karo

`phase-0-hub/hub-intake/workflow.json` import karo, **Active** toggle on karo, aur uska workflow ID copy kar lo (n8n workflow URL me dikhega, ya top-right "..." → Copy). **Yahi ek ID hai jo har spoke ko chahiye.**

## Step 3 — Hub-Dispatcher import karo (abhi activate mat karo)

`phase-0-hub/hub-dispatcher/workflow.json` import karo. Isko abhi activate na karo — ismein sab spokes ke IDs baad me daalne hain, ek-ek karke.

## Step 4 — Har spoke import karo, ek-ek karke

Phase 1 se 7 tak har `workflow.json` import karo. Har ek me sirf **ek** placeholder replace karna hai: `REPLACE_WITH_..._HUB_INTAKE_WORKFLOW_ID` ko Step 2 wale Hub-Intake ID se. Har spoke ko sirf Hub-Intake ka ID chahiye — kisi doosre spoke ka nahi.

## Step 5 — Har spoke ko test + Active karo

Import ke turant baad us module ka README ("Test Kaise Kare" section) follow karke ek dry-run zaroor karo, phir Active on karo. Agla spoke import karne se pehle isko confirm kar lo.

## Step 6 — Wapas Hub-Dispatcher me aao

Sab spokes import ho jaane ke baad, Hub-Dispatcher kholo. Ismein ~19 `Execute Workflow` nodes hain (jaise `Execute Workflow - 2.1 Outreach`, `...5.1.1...`, `...6.5...` etc) — har ek me `REPLACE_WITH_..._WORKFLOW_ID` ko us spoke ke real ID se replace karo.

## Step 7 — Hub-Dispatcher ko Active karo

Sab IDs bharne ke baad Dispatcher ko Active karo. Jab tak koi ID placeholder rehta hai, uska event bas `flagged_events` me safely gir jayega — kuch crash nahi hoga, bas tab tak wo hop manual rehta hai.

---

## Zaroori baatein

- Har spoke ke andar sirf **ek** ID daalni hai (Hub-Intake ki) — chahe wo spoke aage kitne bhi modules trigger kare.
- "Doosre module ka ID copy-paste karo" wala kaam ab sirf **ek jagah** hota hai: Hub-Dispatcher ke Switch node ke Execute Workflow nodes me. Pehle (mesh style) ye kaam 4-5 alag jagah (1.5, 2.4, 2.5, 2.6...) manually karna padta tha — yehi star topology ka fayda hai.
- Spokes ko kisi bhi order me import kar sakte ho (strict sequence zaroori nahi) — bas do cheezein fix hain: **Hub-Intake sabse pehle**, aur **Hub-Dispatcher activate sabse aakhir me**.
