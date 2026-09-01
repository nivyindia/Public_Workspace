# Hub-Dispatcher — S4b update

S4b batch me Phase 2 ke 4 modules (2.6, 2.7, 2.9) ne naye `Report to Hub` calls
add kiye. Ye update Dispatcher ke Switch node me un naye event types ke liye
do naye branches wire karta hai — jinke liye actual downstream module already
ban chuka hai.

## Kya wire hua

| Event type | Naya branch → | Kyun |
|---|---|---|
| `contract.signed` | 2.6 Invoice + Payment | S4.4 ne 2.5→2.6 ka direct link hataya tha, ye uska doosra half hai |
| `payment.received` | 2.7 Client Onboarding | S4.5/S4.6 ne 2.6→2.7 ka direct link hataya tha |

## Kya wire NAHI hua, aur kyun

`client.onboarded`, `renewal.due`, `renewal.overdue`, `payment.failed` — in
sab ka koi downstream consumer module abhi ban hi nahi hai (Phase 6
churn/win-back, health-scoring, waapas-active-karna — inme se koi bhi module
is codebase me exist nahi karta, na `00_Automation.zip` me na `00_Marketing.zip`
me). Inhe route karne ke liye kuch hai hi nahi, isliye Switch me branch nahi
banaya — ye 4 event types abhi `Log Flagged Event` (fallback) me hi jaayenge,
jo sahi/expected behavior hai jab tak S5/S6 ke modules banenge.

## ⚠️ Ek cheez jo flag karni zaroori thi, delete nahi ki

Dispatcher me S2 (pehle se) ek `client.won → Execute Workflow - 2.7 Onboarding`
branch tha — us waqt 2.6/2.7 exist nahi karte the, aur assumption thi ki deal
"Won" hote hi onboarding shuru ho jaani chahiye. Ab jab 2.6 (invoicing) aur
2.7 dono ban chuke hain, real flow hai: **Won → Invoiced → Paid → Onboarded**
— onboarding ko `client.won` par nahi, `payment.received` par shuru hona
chahiye, warna payment se pehle hi onboarding shuru ho jaayegi.

Maine dono branches saath me rehne diye hain (`client.won → 2.7` purana wala,
aur `payment.received → 2.7` naya wala) — **purana wala delete nahi kiya**
kyunki wo S2 me deliberately banaya gaya tha aur bina confirm kiye kisi
pehle-se-built cheez ko hata dena galat hota. Isse pehle ki Dispatcher ko
production me chalao, ye decide karna zaroori hai:

- **Option A (recommended):** `client.won → Execute Workflow - 2.7 Onboarding`
  branch aur uska Execute Workflow node hata do — onboarding sirf
  `payment.received` par ho, jo actual billing-complete signal hai.
- **Option B:** Agar business logic me "unpaid onboarding" ek valid case hai
  (e.g. NET-30 clients jinka onboarding payment se pehle shuru hota hai), to
  dono branches rakho, lekin phir 2.7 khud duplicate-onboarding se apne aap
  ko bachaye (`odoo_project_id already set to skip` — README me already
  known-limitation likha hai).

Is decision ke baad hi is Dispatcher ko import/activate karo.

## ✅ RESOLVED — Option B applied (revised, this session)

Was initially shipped as Option A (branch removed). **Abhi confirmed:
NET-30/unpaid onboarding hai ek real business case** — so this has been
reverted to **Option B**: both `client.won → 2.7` and
`payment.received → 2.7` branches now exist in the Switch node, each with
its own clearly-named Execute Workflow node
(`Execute Workflow - 2.7 Onboarding (client.won)` and
`Execute Workflow - 2.7 Onboarding (payment.received)`), both pointing at
the same 2.7 workflow.

Per Option B's own stated requirement, **2.7 now has a duplicate-onboarding
guard**: an `IF Not Yet Onboarded (duplicate guard)` node right after
`Fetch Lead + Deal Detail`, checking whether
`clients_master.odoo_project_id` is already set. If it is (meaning this
client already went through onboarding via the other event), the whole
Nextcloud/Odoo/email chain is skipped — no duplicate project, folder,
Discuss channel, or welcome email. See `2.7-client-onboarding/README.md`'s
updated Known Limitations section.
