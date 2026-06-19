#!/usr/bin/env bash
set -euo pipefail

REPO="edwardchew97/clawhouse-onboarding-kit"
REF="${CLAWHOUSE_ONBOARDING_REF:-main}"
SKILL_NAME="clawhouse-creator-onboarding"
INSTALL_ROOT="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}"
TARGET_DIR="$INSTALL_ROOT/$SKILL_NAME"

tmp_dir="$(mktemp -d)"
cleanup() {
  rm -rf "$tmp_dir"
}
trap cleanup EXIT

archive_url="https://github.com/$REPO/archive/refs/heads/$REF.tar.gz"
if [[ "$REF" == v* ]]; then
  archive_url="https://github.com/$REPO/archive/refs/tags/$REF.tar.gz"
fi

echo "Downloading ClawHouse onboarding kit from $archive_url"
curl -fsSL "$archive_url" -o "$tmp_dir/clawhouse-onboarding-kit.tar.gz"
tar -xzf "$tmp_dir/clawhouse-onboarding-kit.tar.gz" -C "$tmp_dir"

src_dir="$(find "$tmp_dir" -maxdepth 1 -type d -name 'clawhouse-onboarding-kit-*' | head -n 1)"
if [[ -z "$src_dir" || ! -f "$src_dir/skills/$SKILL_NAME/SKILL.md" ]]; then
  echo "error: downloaded archive does not contain skills/$SKILL_NAME/SKILL.md" >&2
  exit 1
fi

mkdir -p "$INSTALL_ROOT"
rm -rf "$TARGET_DIR"
cp -R "$src_dir/skills/$SKILL_NAME" "$TARGET_DIR"

echo "Installed $SKILL_NAME to $TARGET_DIR"
echo "Start in Claude Code with: /$SKILL_NAME"
