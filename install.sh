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

# Default flags (install all if no specific platform requested)
INSTALL_CLAUDE=false
INSTALL_CODEX=false
INSTALL_CURSOR=false
INSTALL_TRAE=false
INSTALL_ANTIGRAVITY=false
INSTALL_ALL=false

# Help function
show_help() {
    echo "Usage: ./install.sh [OPTIONS]"
    echo
    echo "Options:"
    echo "  --all          Install to all platforms (default if no options provided)"
    echo "  --claude       Install to Claude Code"
    echo "  --codex        Install to Codex CLI"
    echo "  --cursor       Install to Cursor"
    echo "  --trae         Install to Trae IDE"
    echo "  --antigravity  Install to Google Antigravity"
    echo "  --list         List all available skills and descriptions"
    echo "  --help         Show this help message"
    echo
}

# Parse arguments
if [ $# -eq 0 ]; then
    INSTALL_ALL=true
else
    for arg in "$@"; do
        case $arg in
            --all)
                INSTALL_ALL=true
                shift
                ;;
            --claude)
                INSTALL_CLAUDE=true
                shift
                ;;
            --codex)
                INSTALL_CODEX=true
                shift
                ;;
            --cursor)
                INSTALL_CURSOR=true
                shift
                ;;
            --trae)
                INSTALL_TRAE=true
                shift
                ;;
            --antigravity)
                INSTALL_ANTIGRAVITY=true
                shift
                ;;
            --list)
                if [ -f "$SCRIPT_DIR/list_skills.py" ]; then
                    "$SCRIPT_DIR/list_skills.py"
                else
                    echo "Error: list_skills.py not found in $SCRIPT_DIR"
                fi
                exit 0
                ;;
            --help)
                show_help
                exit 0
                ;;
            *)
                echo "Unknown option: $arg"
                show_help
                exit 1
                ;;
        esac
    done
fi

if [ "$INSTALL_ALL" = true ]; then
    INSTALL_CLAUDE=true
    INSTALL_CODEX=true
    INSTALL_CURSOR=true
    INSTALL_TRAE=true
    INSTALL_ANTIGRAVITY=true
fi

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

INSTALLED_ANY=false

# Install to Claude
if [ "$INSTALL_CLAUDE" = true ]; then
    echo -e "${GREEN}Installing to Claude (~/.claude/skills/)...${NC}"
    mkdir -p "$CLAUDE_DIR"
    rsync -av --delete --exclude='.DS_Store' "$SKILLS_DIR/" "$CLAUDE_DIR/" > /dev/null
    echo "  ✓ Done"
    INSTALLED_ANY=true
fi

# Install to Codex
if [ "$INSTALL_CODEX" = true ]; then
    echo -e "${GREEN}Installing to Codex (~/.codex/skills/)...${NC}"
    mkdir -p "$CODEX_DIR"
    rsync -av --delete --exclude='.DS_Store' --exclude='.system' "$SKILLS_DIR/" "$CODEX_DIR/" > /dev/null
    echo "  ✓ Done"
    INSTALLED_ANY=true
fi

# Install to Cursor
if [ "$INSTALL_CURSOR" = true ]; then
    echo -e "${GREEN}Installing to Cursor (~/.cursor/skills/)...${NC}"
    mkdir -p "$CURSOR_DIR"
    rsync -av --delete --exclude='.DS_Store' "$SKILLS_DIR/" "$CURSOR_DIR/" > /dev/null
    echo "  ✓ Done"
    INSTALLED_ANY=true
fi

# Install to Trae
if [ "$INSTALL_TRAE" = true ]; then
    echo -e "${GREEN}Installing to Trae (~/.trae/skills/)...${NC}"
    mkdir -p "$TRAE_DIR"
    rsync -av --delete --exclude='.DS_Store' "$SKILLS_DIR/" "$TRAE_DIR/" > /dev/null
    echo "  ✓ Done"
    INSTALLED_ANY=true
fi

# Install to Antigravity
if [ "$INSTALL_ANTIGRAVITY" = true ]; then
    echo -e "${GREEN}Installing to Antigravity (~/.gemini/antigravity/skills/)...${NC}"
    mkdir -p "$ANTIGRAVITY_DIR"
    rsync -av --delete --exclude='.DS_Store' "$SKILLS_DIR/" "$ANTIGRAVITY_DIR/" > /dev/null
    echo "  ✓ Done"
    INSTALLED_ANY=true
fi

if [ "$INSTALLED_ANY" = true ]; then
    echo
    echo -e "${GREEN}════════════════════════════════════════════${NC}"
    echo -e "${GREEN}Installation complete!${NC}"
    echo -e "${GREEN}════════════════════════════════════════════${NC}"
    echo
    echo "Skills installed to:"
    [ "$INSTALL_CLAUDE" = true ] && echo "  • Claude:      $CLAUDE_DIR"
    [ "$INSTALL_CODEX" = true ] && echo "  • Codex:       $CODEX_DIR"
    [ "$INSTALL_CURSOR" = true ] && echo "  • Cursor:      $CURSOR_DIR"
    [ "$INSTALL_TRAE" = true ] && echo "  • Trae:        $TRAE_DIR"
    [ "$INSTALL_ANTIGRAVITY" = true ] && echo "  • Antigravity: $ANTIGRAVITY_DIR"
    echo
    echo "Restart your AI coding assistants to load the new skills."
else
    echo "No platforms selected. Use --all or specific flags (e.g., --claude)."
    show_help
fi
