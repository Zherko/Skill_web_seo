#!/usr/bin/env bash
# Installer for skill-web-seo (OpenCode)
# Installs: skill (canonical hyphen name) + slash commands (canonical + legacy alias)
# Usage: bash install.sh [--global] [--project]
#   --global  -> ~/.config/opencode (default)
#   --project -> ./.opencode (current project)
set -euo pipefail

MODE="global"
for arg in "$@"; do
  case "$arg" in
    --project) MODE="project" ;;
    --global) MODE="global" ;;
  esac
done

SRC_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [ "$MODE" = "project" ]; then
  BASE="./.opencode"
else
  BASE="$HOME/.config/opencode"
fi

SKILL_DIR="$BASE/skills/skill-web-seo"
CMD_DIR="$BASE/commands"
LEGACY_SKILL_DIR="$BASE/skills/skill_web_seo"

mkdir -p "$SKILL_DIR" "$CMD_DIR"

# 1. Skill (canonical, spec-compliant hyphen name)
cp "$SRC_DIR/SKILL.md" "$SKILL_DIR/SKILL.md"

# 2. Slash commands: canonical + legacy alias (both load the same skill)
cp "$SRC_DIR/command.md" "$CMD_DIR/skill-web-seo.md"
cp "$SRC_DIR/command-legacy.md" "$CMD_DIR/skill_web_seo.md"

# 3. Migrate legacy skill dir if present (keep as fallback, don't break old refs)
if [ -d "$LEGACY_SKILL_DIR" ]; then
  echo "Legacy skill dir found at $LEGACY_SKILL_DIR — kept as fallback."
else
  echo "No legacy skill dir — canonical install is enough."
fi

echo "--- verify ---"
test -f "$SKILL_DIR/SKILL.md" && echo "OK skill: $SKILL_DIR/SKILL.md"
test -f "$CMD_DIR/skill-web-seo.md" && echo "OK command: $CMD_DIR/skill-web-seo.md (/skill-web-seo)"
test -f "$CMD_DIR/skill_web_seo.md" && echo "OK alias:   $CMD_DIR/skill_web_seo.md (/skill_web_seo)"
head -3 "$SKILL_DIR/SKILL.md"
echo "Done. Restart opencode TUI and type /skill-web-seo"
