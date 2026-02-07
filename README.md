# dotfiles-skills

中文 | [English](./README_EN.md)

专业 Agent Skills 集合，用于 Claude Code、Codex CLI、Cursor、Trae IDE 和 Google Antigravity。

## 快速安装

### 方法一：使用安装脚本（推荐）

```bash
git clone git@github.com:tniuli/dotfiles-skills.git ~/dotfiles-skills
cd ~/dotfiles-skills
./install.sh
```

### 方法二：使用 Skills CLI

```bash
# 安装 Vercel Labs Skills CLI
npm install -g @vercel-labs/skills

# 安装所有 skills 到所有支持的 Agent
npx skills add tniuli/dotfiles-skills --all

# 或安装特定 skills
npx skills add tniuli/dotfiles-skills --skill react-best-practices --skill web-design-guidelines

# 查看已安装的 skills
npx skills list
```

### 支持的安装选项

```bash
# 安装到特定 Agent
npx skills add tniuli/dotfiles-skills -a claude-code -a cursor

# 全局安装（所有项目可用）
npx skills add tniuli/dotfiles-skills -g

# 仅安装特定 skills
npx skills add tniuli/dotfiles-skills --skill react-best-practices --skill typescript-expert

# 查看可用 skills
npx skills add tniuli/dotfiles-skills --list
```

## Skills 概览

### 前端开发 (Frontend)

| Skill | 描述 |
|-------|------|
| `react-best-practices` | Vercel 官方 40+ React/Next.js 性能优化规则 |
| `web-design-guidelines` | 100+ UI/UX/可访问性审计规则 |
| `implement-frontend` | React/TypeScript/Next.js 实现标准 |
| `design-ui` | UI 设计方向指南 |
| `audit-ui` | UI 质量审计（排版、无障碍） |
| `ui-animation` | 动画与运动设计规范 |
| `nextjs` | Next.js 开发最佳实践 |
| `react` | React 组件模式与 hooks |
| `tailwind-v4-shadcn` | Tailwind v4 + shadcn/ui |
| `tailwind-patterns` | Tailwind CSS 常用模式 |
| `shadcn` | shadcn/ui 组件库 |
| `tanstack-query` | TanStack Query 数据获取 |
| `tanstack-router` | TanStack Router 路由 |
| `tanstack-table` | TanStack Table 表格 |
| `zustand-state-management` | Zustand 状态管理 |
| `react-hook-form-zod` | 表单处理与验证 |
| `motion` | Framer Motion 动画 |
| `mui` | Material UI 组件库 |
| `ui-ux-pro-max` | 智能 UI/UX 设计系统生成器 |

### 后端开发 (Backend)

| Skill | 描述 |
|-------|------|
| `go-service-standards` | Go 后端服务工程标准 |
| `express` | Express.js 框架 |
| `nodejs` | Node.js 开发模式 |
| `prisma` | Prisma ORM |
| `hono-routing` | Hono 路由框架 |
| `python-patterns` | Python 编程模式 |
| `database-design` | 数据库设计最佳实践 |
| `docker-expert` | Docker 容器化专家 |

### 身份验证 (Authentication)

| Skill | 描述 |
|-------|------|
| `clerk-auth` | Clerk 身份验证集成 |
| `better-auth` | Better Auth 解决方案 |

### AI/SDK

| Skill | 描述 |
|-------|------|
| `ai-sdk-core` | Vercel AI SDK v5 核心 |
| `ai-sdk-ui` | Vercel AI SDK UI 组件 |

### 开发工具 (DevTools)

| Skill | 描述 |
|-------|------|
| `plan-feature` | 功能规划与技术规格 |
| `define-architecture` | 架构定义与工作流 |
| `review-pr` | PR 审查 |
| `optimise-seo` | SEO 优化 |
| `developer-toolbox` | 开发者工具箱（7 个 Agent） |
| `playwright-local` | E2E 测试 |
| `webapp-testing` | Web 应用测试 |
| `mcp-builder` | MCP 服务器构建 |
| `clean-code` | 代码整洁之道 |
| `code-review-checklist` | 代码审查清单 |
| `systematic-debugging` | 系统化调试方法 |
| `performance-profiling` | 性能分析与优化 |
| `git-pushing` | Git 提交规范与流程 |
| `api-security-best-practices` | API 安全最佳实践 |
| `typescript-expert` | TypeScript 专家指南 |

### 文档处理 (Documents)

| Skill | 描述 |
|-------|------|
| `docx` | Word 文档处理 |
| `pdf` | PDF 处理 |
| `pptx` | PowerPoint 处理 |
| `xlsx` | Excel 处理 |
| `humanizer` | 文本去 AI 化与润色 |

### 创意设计 (Creative)

| Skill | 描述 |
|-------|------|
| `canvas-design` | 视觉艺术设计 |
| `algorithmic-art` | 生成艺术 |
| `theme-factory` | 主题样式工具包 |
| `frontend-design` | 前端设计 |
| `brand-guidelines` | 品牌指南 |
| `slack-gif-creator` | Slack GIF 创建 |

### 通用配置 (General)

| Skill | 描述 |
|-------|------|
| `chinese-default` | 中文环境默认配置 |

## 目录结构

```
dotfiles-skills/
├── install.sh           # 一键安装脚本
├── README.md            # 本文件
├── .gitignore
└── skills/              # 所有 skills
    ├── react-best-practices/
    ├── go-service-standards/
    ├── ...
    └── zustand-state-management/

## 支持的平台

| 平台 | 安装路径 |
|------|----------|
| Claude Code | `~/.claude/skills/` |
| Codex CLI | `~/.codex/skills/` |
| Cursor | `~/.cursor/skills/` |
| Trae IDE | `~/.trae/skills/` |
| Google Antigravity | `~/.gemini/antigravity/skills/` |
```

## 更新 Skills

```bash
cd ~/dotfiles-skills
git pull
./install.sh
```

## 添加新 Skill

1. 在 `skills/` 目录下创建新的 skill 文件夹
2. 创建 `SKILL.md` 文件（必需）
3. 运行 `./install.sh` 安装
4. 提交并推送到 GitHub

```bash
mkdir -p skills/my-new-skill
# 编辑 skills/my-new-skill/SKILL.md
./install.sh
git add .
git commit -m "feat: add my-new-skill"
git push
```

## 来源

本仓库整合了以下优秀的 Agent Skills：

- [anthropics/skills](https://github.com/anthropics/skills) - Anthropic 官方
- [vercel-labs/agent-skills](https://github.com/vercel-labs/agent-skills) - Vercel 官方
- [jezweb/claude-skills](https://github.com/jezweb/claude-skills) - 87个生产级 skills
- [mblode/agent-skills](https://github.com/mblode/agent-skills) - UI/前端质量 skills
- [blencorp/claude-code-kit](https://github.com/blencorp/claude-code-kit) - 框架 kits
- [sickn33/antigravity-awesome-skills](https://github.com/sickn33/antigravity-awesome-skills) - 200+ Agent Skills
- [openclaw/skills](https://github.com/openclaw/skills) - Clawdhub.com 归档（海量 Skills）
- [nextlevelbuilder/ui-ux-pro-max-skill](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill) - UI/UX 设计智能 Skill
- [blader/humanizer](https://github.com/blader/humanizer) - 文本去 AI 化 Skill

## 许可证

各 skill 保留其原始许可证。查看各 skill 目录中的 LICENSE 文件。
