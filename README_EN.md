# dotfiles-skills

[中文](./README.md) | English

Professional collection of Agent Skills for Claude Code, Codex CLI, Cursor, Trae IDE, and Google Antigravity.

## Quick Install

### Method 1: Using Install Script (Recommended)

```bash
git clone git@github.com:tniuli/dotfiles-skills.git ~/dotfiles-skills
cd ~/dotfiles-skills
./install.sh
```

### Method 2: Using Skills CLI

```bash
# Install Vercel Labs Skills CLI
npm install -g @vercel-labs/skills

# Install all skills to all supported Agents
npx skills add tniuli/dotfiles-skills --all

# Or install specific skills
npx skills add tniuli/dotfiles-skills --skill react-best-practices --skill web-design-guidelines

# List installed skills
npx skills list
```

### Supported Installation Options

```bash
# Install to specific Agents
npx skills add tniuli/dotfiles-skills -a claude-code -a cursor

# Global install (available across all projects)
npx skills add tniuli/dotfiles-skills -g

# Install only specific skills
npx skills add tniuli/dotfiles-skills --skill react-best-practices --skill typescript-expert

# List available skills
npx skills add tniuli/dotfiles-skills --list
```

## Skills Overview

### Frontend

| Skill | Description |
|-------|-------------|
| `react-best-practices` | Vercel official 40+ React/Next.js performance optimization rules |
| `web-design-guidelines` | 100+ UI/UX/Accessibility audit rules |
| `implement-frontend` | React/TypeScript/Next.js implementation standards |
| `design-ui` | UI design direction guidelines |
| `audit-ui` | UI quality audit (typography, accessibility) |
| `ui-animation` | Animation and motion design guidelines |
| `nextjs` | Next.js development best practices |
| `react` | React component patterns and hooks |
| `tailwind-v4-shadcn` | Tailwind v4 + shadcn/ui setup |
| `tailwind-patterns` | Tailwind CSS common patterns |
| `shadcn` | shadcn/ui component library |
| `tanstack-query` | TanStack Query data fetching |
| `tanstack-router` | TanStack Router routing |
| `tanstack-table` | TanStack Table implementation |
| `zustand-state-management` | Zustand state management |
| `react-hook-form-zod` | Form handling and validation |
| `motion` | Framer Motion animations |
| `mui` | Material UI component library |
| `ui-ux-pro-max` | Intelligent UI/UX Design System Generator |

### Backend

| Skill | Description |
|-------|-------------|
| `go-service-standards` | Go backend service engineering standards |
| `express` | Express.js framework patterns |
| `nodejs` | Node.js development patterns |
| `prisma` | Prisma ORM usage |
| `hono-routing` | Hono routing framework |
| `python-patterns` | Python programming patterns |
| `database-design` | Database design best practices |
| `docker-expert` | Docker containerization expert |

### Authentication

| Skill | Description |
|-------|-------------|
| `clerk-auth` | Clerk authentication integration |
| `better-auth` | Better Auth solution |

### AI/SDK

| Skill | Description |
|-------|-------------|
| `ai-sdk-core` | Vercel AI SDK v5 core |
| `ai-sdk-ui` | Vercel AI SDK UI components |

### DevTools

| Skill | Description |
|-------|-------------|
| `plan-feature` | Feature planning and technical specs |
| `define-architecture` | Architecture definition and workflow |
| `review-pr` | PR review guidelines |
| `optimise-seo` | SEO optimization |
| `developer-toolbox` | Developer toolbox (7 Agents) |
| `playwright-local` | E2E testing with Playwright |
| `webapp-testing` | Web application testing |
| `mcp-builder` | MCP server builder |
| `clean-code` | Clean code principles |
| `code-review-checklist` | Code review checklist |
| `systematic-debugging` | Systematic debugging methods |
| `performance-profiling` | Performance profiling and optimization |
| `git-pushing` | Git commit standards and workflow |
| `api-security-best-practices` | API security best practices |
| `typescript-expert` | TypeScript expert guidelines |

### Documents

| Skill | Description |
|-------|-------------|
| `docx` | Word document processing |
| `pdf` | PDF processing |
| `pptx` | PowerPoint processing |
| `xlsx` | Excel processing |

### Creative

| Skill | Description |
|-------|-------------|
| `canvas-design` | Visual art design |
| `algorithmic-art` | Generative art |
| `theme-factory` | Theme styling toolkit |
| `frontend-design` | Frontend design implementation |
| `brand-guidelines` | Brand guidelines application |
| `slack-gif-creator` | Slack GIF creation |

### General

| Skill | Description |
|-------|-------------|
| `chinese-default` | Default configuration for Chinese environment |

## Directory Structure

```
dotfiles-skills/
├── install.sh           # One-click install script
├── README.md            # This file (Chinese)
├── README_EN.md         # English documentation
├── .gitignore
└── skills/              # All skills
    ├── react-best-practices/
    ├── go-service-standards/
    ├── ...
    └── zustand-state-management/
```

## Supported Platforms

| Platform | Install Path |
|----------|--------------|
| Claude Code | `~/.claude/skills/` |
| Codex CLI | `~/.codex/skills/` |
| Cursor | `~/.cursor/skills/` |
| Trae IDE | `~/.trae/skills/` |
| Google Antigravity | `~/.gemini/antigravity/skills/` |

## Updating Skills

```bash
cd ~/dotfiles-skills
git pull
./install.sh
```

## Adding New Skills

1. Create a new skill folder in `skills/` directory
2. Create `SKILL.md` file (Required)
3. Run `./install.sh` to install
4. Commit and push to GitHub

```bash
mkdir -p skills/my-new-skill
# Edit skills/my-new-skill/SKILL.md
./install.sh
git add .
git commit -m "feat: add my-new-skill"
git push
```

## Sources

This repository integrates excellent Agent Skills from:

- [anthropics/skills](https://github.com/anthropics/skills) - Anthropic Official
- [vercel-labs/agent-skills](https://github.com/vercel-labs/agent-skills) - Vercel Official
- [jezweb/claude-skills](https://github.com/jezweb/claude-skills) - 87 production-grade skills
- [mblode/agent-skills](https://github.com/mblode/agent-skills) - UI/Frontend quality skills
- [blencorp/claude-code-kit](https://github.com/blencorp/claude-code-kit) - Framework kits
- [sickn33/antigravity-awesome-skills](https://github.com/sickn33/antigravity-awesome-skills) - 200+ Agent Skills
- [openclaw/skills](https://github.com/openclaw/skills) - Clawdhub.com archive (Huge collection)
- [nextlevelbuilder/ui-ux-pro-max-skill](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill) - UI/UX Design Intelligence Skill

## License

Each skill retains its original license. See the LICENSE file in each skill directory.
