# Automation/ — Exported n8n Workflow JSON

**Decision (Correction Batch 0, 2026-07-23):** this folder is repurposed as the landing
spot for exported n8n workflow `.json` files, rather than deleted, since Batch 1
(n8n Template Linking Pass) begins referencing live templates from
`nivyindia/all_n8n_templates_collection` and n8n.io — once any of those templates are
imported into an actual n8n instance and adapted, the exported workflow JSON for this
business's specific configuration belongs here, one file per workflow, named after the
stage it serves (e.g. `sales-06-lead-extraction.json`).

This folder was empty prior to this decision. It contains no content yet because no
workflow has been built and exported from a live n8n instance in this session — adding
the template *links* (Batch 1) is not the same as having a running, exported workflow.
Do not treat this README as a stand-in for that work.
