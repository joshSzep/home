#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MANUSCRIPT_MD="$SCRIPT_DIR/MANUSCRIPT.md"
COVER_IMAGE="$SCRIPT_DIR/front-cover.png"
OUTPUT_EPUB="$SCRIPT_DIR/Home.epub"

require_command() {
  if ! command -v "$1" >/dev/null 2>&1; then
    printf 'Missing required command: %s\n' "$1" >&2
    exit 1
  fi
}

require_file() {
  if [[ ! -f "$1" ]]; then
    printf 'Required file not found: %s\n' "$1" >&2
    exit 1
  fi
}

require_command pandoc
require_file "$SCRIPT_DIR/rebuild-manuscript.sh"
require_file "$COVER_IMAGE"

cd "$SCRIPT_DIR"
./rebuild-manuscript.sh

require_file "$MANUSCRIPT_MD"

pandoc "$MANUSCRIPT_MD" \
  --from markdown-implicit_figures \
  --to epub3 \
  --toc \
  --toc-depth=2 \
  --split-level=2 \
  --metadata title="Home" \
  --metadata author="Joshua Szepietowski" \
  --metadata lang="en-US" \
  --resource-path="$SCRIPT_DIR" \
  --epub-cover-image="$COVER_IMAGE" \
  --output "$OUTPUT_EPUB"

printf 'Built %s\n' "$OUTPUT_EPUB"
