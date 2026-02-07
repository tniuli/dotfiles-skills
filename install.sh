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

# Selected skills (empty means all)
SELECTED_SKILLS=()

# Help function
show_help() {
    echo "Usage: ./install.sh [OPTIONS]"
    echo
    echo "Options:"
    echo "  --all                 Install to all platforms (default if no options provided)"
    echo "  --claude              Install to Claude Code"
    echo "  --codex               Install to Codex CLI"
    echo "  --cursor              Install to Cursor"
    echo "  --trae                Install to Trae IDE"
    echo "  --antigravity         Install to Google Antigravity"
    echo "  --skill <name>        Install only specific skill(s). Can be used multiple times."
    echo "  --update              Update skills from upstream repositories before installing"
    echo "  --list                List all available skills and descriptions"
    echo "  --help                Show this help message"
    echo
}

# Parse arguments
while [[ $# -gt 0 ]]; do
    key="$1"
    case $key in
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
        --skill)
            if [ -n "$2" ] && [ "${2:0:1}" != "-" ]; then
                SELECTED_SKILLS+=("$2")
                shift
                shift
            else
                echo "Error: Argument for --skill is missing" >&2
                exit 1
            fi
            ;;
        --update)
            UPDATE_SKILLS=true
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
            echo "Unknown option: $key"
            show_help
            exit 1
            ;;
    esac
done

# If no platform flags were set, default to ALL
if [ "$INSTALL_CLAUDE" = false ] && \
   [ "$INSTALL_CODEX" = false ] && \
   [ "$INSTALL_CURSOR" = false ] && \
   [ "$INSTALL_TRAE" = false ] && \
   [ "$INSTALL_ANTIGRAVITY" = false ] && \
   [ "$INSTALL_ALL" = false ]; then
    INSTALL_ALL=true
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

if [ "$UPDATE_SKILLS" = true ]; then
    echo -e "${BLUE}Updating skills from upstream...${NC}"
    if [ -f "$SCRIPT_DIR/update_skills.py" ]; then
        "$SCRIPT_DIR/update_skills.py"
    else
        echo "Error: update_skills.py not found in $SCRIPT_DIR"
    fi
    echo
fi

# Count/Verify skills to install
if [ ${#SELECTED_SKILLS[@]} -gt 0 ]; then
    echo -e "${YELLOW}Selected ${#SELECTED_SKILLS[@]} specific skills to install:${NC}"
    for skill in "${SELECTED_SKILLS[@]}"; do
        if [ ! -d "$SKILLS_DIR/$skill" ]; then
            echo "Error: Skill '$skill' not found in $SKILLS_DIR"
            exit 1
        fi
        echo "  - $skill"
    done
else
    SKILL_COUNT=$(find "$SKILLS_DIR" -maxdepth 1 -type d | wc -l)
    SKILL_COUNT=$((SKILL_COUNT - 1))
    echo -e "${YELLOW}Installing ALL ${SKILL_COUNT} available skills${NC}"
fi
echo

# List skills to be installed
echo "----------------------------------------------------------------"
echo "Skills to be installed / 即将安装的 Skills:"
echo "----------------------------------------------------------------"
if [ ${#SELECTED_SKILLS[@]} -gt 0 ]; then
    for skill in "${SELECTED_SKILLS[@]}"; do
        echo "  - $skill"
    done
else
    find "$SKILLS_DIR" -maxdepth 1 -type d -not -path '*/.*' -not -path "$SKILLS_DIR" | sed "s|$SKILLS_DIR/|  - |" | sort
fi
echo "----------------------------------------------------------------"

# Ask for confirmation
read -p "Proceed with installation? / 确认安装? [Y/n] " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]] && [[ -n $REPLY ]]; then
    echo "Installation aborted. / 安装已取消。"
    exit 1
fi

INSTALLED_ANY=false

install_skills() {
    local target_dir="$1"
    local platform_name="$2"
    local exclude_system="$3"
    
    echo -e "${GREEN}Installing to $platform_name ($target_dir)...${NC}"
    mkdir -p "$target_dir"
    
    if [ ${#SELECTED_SKILLS[@]} -eq 0 ]; then
        # Install all
        if [ "$exclude_system" = "true" ]; then
            rsync -av --delete --exclude='.DS_Store' --exclude='.system' "$SKILLS_DIR/" "$target_dir/" > /dev/null
        else
            rsync -av --delete --exclude='.DS_Store' "$SKILLS_DIR/" "$target_dir/" > /dev/null
        fi
    else
        # Install specific skills
        for skill in "${SELECTED_SKILLS[@]}"; do
            rsync -av --exclude='.DS_Store' "$SKILLS_DIR/$skill" "$target_dir/" > /dev/null
        done
    fi
    echo "  ✓ Done"
}

# Install to Claude
if [ "$INSTALL_CLAUDE" = true ]; then
    install_skills "$CLAUDE_DIR" "Claude" "false"
    INSTALLED_ANY=true
fi

# Install to Codex
if [ "$INSTALL_CODEX" = true ]; then
    install_skills "$CODEX_DIR" "Codex" "true"
    INSTALLED_ANY=true
fi

# Install to Cursor
if [ "$INSTALL_CURSOR" = true ]; then
    install_skills "$CURSOR_DIR" "Cursor" "false"
    INSTALLED_ANY=true
fi

# Install to Trae
if [ "$INSTALL_TRAE" = true ]; then
    install_skills "$TRAE_DIR" "Trae" "false"
    INSTALLED_ANY=true
fi

# Install to Antigravity
if [ "$INSTALL_ANTIGRAVITY" = true ]; then
    install_skills "$ANTIGRAVITY_DIR" "Antigravity" "false"
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

    echo "----------------------------------------------------------------"
    echo "Installed Skills List / 已安装 Skills 列表:"
    echo "----------------------------------------------------------------"
    if [ ${#SELECTED_SKILLS[@]} -gt 0 ]; then
        for skill in "${SELECTED_SKILLS[@]}"; do
            echo "  - $skill"
        done
    else
        find "$SKILLS_DIR" -maxdepth 1 -type d -not -path '*/.*' -not -path "$SKILLS_DIR" | sed "s|$SKILLS_DIR/|  - |" | sort
    fi
    echo "----------------------------------------------------------------"

    echo "Restart your AI coding assistants to load the new skills."
else
    echo "No platforms selected. Use --all or specific flags (e.g., --claude)."
    show_help
fi
