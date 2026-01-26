#!/bin/bash
# Agent Skills Installer
# Installs skills to Claude, Codex, Cursor, Trae, and Antigravity global directories

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_DIR="$SCRIPT_DIR/skills"

# Target directories
CLAUDE_DIR="$HOME/.claude/skills"
CODEX_DIR="$HOME/.codex/skills"
CURSOR_DIR="$HOME/.cursor/skills"
TRAE_DIR="$HOME/.trae/skills"
ANTIGRAVITY_DIR="$HOME/.gemini/antigravity/skills"

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}╔════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║     Agent Skills Installer                 ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════════╝${NC}"
echo

# Check if skills directory exists
if [ ! -d "$SKILLS_DIR" ]; then
    echo "Error: skills directory not found at $SKILLS_DIR"
    exit 1
fi

# Count skills
SKILL_COUNT=$(find "$SKILLS_DIR" -maxdepth 1 -type d | wc -l)
SKILL_COUNT=$((SKILL_COUNT - 1))  # Subtract 1 for the skills directory itself

echo -e "${YELLOW}Found ${SKILL_COUNT} skills to install${NC}"
echo

# Install to Claude
echo -e "${GREEN}[1/5]${NC} Installing to Claude (~/.claude/skills/)..."
mkdir -p "$CLAUDE_DIR"
rsync -av --delete --exclude='.DS_Store' "$SKILLS_DIR/" "$CLAUDE_DIR/" > /dev/null
echo "      ✓ Done"

# Install to Codex
echo -e "${GREEN}[2/5]${NC} Installing to Codex (~/.codex/skills/)..."
mkdir -p "$CODEX_DIR"
rsync -av --delete --exclude='.DS_Store' --exclude='.system' "$SKILLS_DIR/" "$CODEX_DIR/" > /dev/null
echo "      ✓ Done"

# Install to Cursor
echo -e "${GREEN}[3/5]${NC} Installing to Cursor (~/.cursor/skills/)..."
mkdir -p "$CURSOR_DIR"
rsync -av --delete --exclude='.DS_Store' "$SKILLS_DIR/" "$CURSOR_DIR/" > /dev/null
echo "      ✓ Done"

# Install to Trae
echo -e "${GREEN}[4/5]${NC} Installing to Trae (~/.trae/skills/)..."
mkdir -p "$TRAE_DIR"
rsync -av --delete --exclude='.DS_Store' "$SKILLS_DIR/" "$TRAE_DIR/" > /dev/null
echo "      ✓ Done"

# Install to Antigravity
echo -e "${GREEN}[5/5]${NC} Installing to Antigravity (~/.gemini/antigravity/skills/)..."
mkdir -p "$ANTIGRAVITY_DIR"
rsync -av --delete --exclude='.DS_Store' "$SKILLS_DIR/" "$ANTIGRAVITY_DIR/" > /dev/null
echo "      ✓ Done"

echo
echo -e "${GREEN}════════════════════════════════════════════${NC}"
echo -e "${GREEN}Installation complete!${NC}"
echo -e "${GREEN}════════════════════════════════════════════${NC}"
echo
echo "Skills installed to:"
echo "  • Claude:      $CLAUDE_DIR"
echo "  • Codex:       $CODEX_DIR"
echo "  • Cursor:      $CURSOR_DIR"
echo "  • Trae:        $TRAE_DIR"
echo "  • Antigravity: $ANTIGRAVITY_DIR"
echo
echo "Restart your AI coding assistants to load the new skills."
