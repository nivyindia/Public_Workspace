#!/bin/bash
# Imports all 14 Growth Engine workflows in one shot via the n8n CLI.
# The CLI import (unlike "Import from File" in the UI) KEEPS the "id" field
# from each JSON file -- which is why 1.5, 2.5 and 2.6's Execute Workflow
# nodes resolve correctly with zero manual copy-pasting of workflow IDs.
#
# Usage (bare-metal / VPS install):
#   ./import-merged-funnel.sh
#
# Usage (Docker):
#   docker cp growth-engine-automation <container>:/tmp/growth-engine-automation
#   docker exec -u node <container> n8n import:workflow --separate --input=/tmp/growth-engine-automation --input=phase-1
#   (see the two docker lines further down for the real two-folder version)

set -e
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/growth-engine-automation"

echo "Importing Phase 1 (Marketing Engine)..."
n8n import:workflow --separate --input="$BASE_DIR/phase-1"

echo "Importing Phase 2 (Sales + Delivery Engine)..."
n8n import:workflow --separate --input="$BASE_DIR/phase-2"

echo ""
echo "Done. All 14 workflows imported with fixed IDs -- the funnel is wired end-to-end:"
echo "  1.1/1.2/1.3/1.4 write leads -> 1.5 polls + routes -> 2.1/2.4/2.5/2.7 (sales) -> 2.6 (invoice) -> 2.7 (onboarding) -> 2.8/2.9 (delivery+renewal)"
echo ""
echo "Still manual (can't be scripted -- they're your secrets/infra, not wiring):"
echo "  - Postgres/Odoo/SMTP/Documenso/etc. credentials (still say REPLACE_WITH_CREDENTIAL_ID)"
echo "  - Activate each workflow in the n8n UI (CLI import leaves everything inactive)"
echo "  - Env vars listed in the top-level README.md 'Common Setup' section"
