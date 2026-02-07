# dotfiles-skills

![License](https://img.shields.io/github/license/tniuli/dotfiles-skills)
![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)

中文 | [English](./README_EN.md)

专业 Agent Skills 集合，用于 Claude Code、Codex CLI、Cursor、Trae IDE 和 Google Antigravity。

## 快速安装

### 方法一：使用安装脚本（推荐）

```bash
git clone git@github.com:tniuli/dotfiles-skills.git ~/dotfiles-skills
cd ~/dotfiles-skills

# 安装到所有平台（默认）
./install.sh

# 或指定安装平台
./install.sh --claude
./install.sh --trae --cursor

# 查看所有可用 Skills
./install.sh --list

# 安装特定 Skill
./install.sh --skill <skill_name>
# 例如：只安装 humanizer 到 Claude
./install.sh --claude --skill humanizer

# 从上游仓库更新 Skill
./install.sh --update
# 更新并安装到 Claude
./install.sh --update --claude

./install.sh --help
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

### Frontend Development / 前端开发

| Skill | 描述 (Description) | 触发条件 (Triggers) | 效果 (Effect) |
|---|---|---|---|
| [`react-best-practices`](./skills/react-best-practices/SKILL.md) | React and Next.js performance optimization guidelines from Vercel Engineering. This skill should be used when writing, reviewing, or refactoring React/Next.js code to ensure optimal performance patterns. Triggers on tasks involving React components, Next.js pages, data fetching, bundle optimization, or performance improvements. | - | - |
| [`web-design-guidelines`](./skills/web-design-guidelines/SKILL.md) | Review UI code for Web Interface Guidelines compliance. Use when asked to "review my UI", "check accessibility", "audit design", "review UX", or "check my site against best practices". | - | - |
| [`implement-frontend`](./skills/implement-frontend/SKILL.md) | Implementation standards for React/TypeScript/Next.js. Use when writing or reviewing frontend code, especially forms, state, hooks/components, and type safety. | - | - |
| [`design-ui`](./skills/design-ui/SKILL.md) | Design direction and visual system for web UI. Use to choose layout, typography, colour, and overall aesthetic for product (SaaS/admin/data-heavy) or marketing/brand experiences. | - | - |
| [`audit-ui`](./skills/audit-ui/SKILL.md) | Final UI quality audit for typography, accessibility, and UX polish. Use when reviewing or refining UI before release. | - | - |
| [`ui-animation`](./skills/ui-animation/SKILL.md) | Guidelines and examples for UI motion and animation. Use when designing, implementing, or reviewing motion, easing, timing, and reduced-motion behaviour. | - | - |
| [`nextjs`](./skills/nextjs/SKILL.md) | Next.js 15+ App Router development patterns including Server Components, Client Components, data fetching, layouts, and server actions. Use when creating pages, routes, layouts, components, API route handlers, server actions, loading states, error boundaries, or working with Next.js navigation and metadata. | - | - |
| [`react`](./skills/react/SKILL.md) | Core React 19 patterns including hooks, Suspense, lazy loading, component structure, TypeScript best practices, and performance optimization. Use when working with React components, hooks, lazy loading, Suspense boundaries, or React-specific TypeScript patterns. | - | - |
| [`tailwind-v4-shadcn`](./skills/tailwind-v4-shadcn/SKILL.md) | See details. | - | - |
| [`tailwind-patterns`](./skills/tailwind-patterns/SKILL.md) | See details. | - | - |
| [`shadcn`](./skills/shadcn/SKILL.md) | shadcn/ui component library patterns with Radix UI primitives and Tailwind CSS. Use when creating tables, forms, dialogs, cards, buttons, or any UI component using shadcn/ui, installing shadcn components, or styling with shadcn patterns. | - | - |
| [`tanstack-query`](./skills/tanstack-query/SKILL.md) | TanStack Query v5 data fetching patterns including useSuspenseQuery, useQuery, mutations, cache management, and API service integration. Use when fetching data, managing server state, or working with TanStack Query hooks. | - | - |
| [`tanstack-router`](./skills/tanstack-router/SKILL.md) | TanStack Router file-based routing patterns including route creation, navigation, loaders, type-safe routing, and lazy loading. Use when creating routes, implementing navigation, or working with TanStack Router. | - | - |
| [`tanstack-table`](./skills/tanstack-table/SKILL.md) | See details. | - | - |
| [`zustand-state-management`](./skills/zustand-state-management/SKILL.md) | See details. | - | - |
| [`react-hook-form-zod`](./skills/react-hook-form-zod/SKILL.md) | See details. | - | - |
| [`motion`](./skills/motion/SKILL.md) | See details. | - | - |
| [`mui`](./skills/mui/SKILL.md) | Material-UI v7 component library patterns including sx prop styling, theme integration, responsive design, and MUI-specific hooks. Use when working with MUI components, styling with sx prop, theme customization, or MUI utilities. | - | - |
| [`ui-ux-pro-max`](./skills/ui-ux-pro-max/SKILL.md) | UI/UX design intelligence. 50 styles, 21 palettes, 50 font pairings, 20 charts, 9 stacks (React, Next.js, Vue, Svelte, SwiftUI, React Native, Flutter, Tailwind, shadcn/ui). Actions: plan, build, create, design, implement, review, fix, improve, optimize, enhance, refactor, check UI/UX code. Projects: website, landing page, dashboard, admin panel, e-commerce, SaaS, portfolio, blog, mobile app, .html, .tsx, .vue, .svelte. Elements: button, modal, navbar, sidebar, card, table, form, chart. Styles: glassmorphism, claymorphism, minimalism, brutalism, neumorphism, bento grid, dark mode, responsive, skeuomorphism, flat design. Topics: color palette, accessibility, animation, layout, typography, font pairing, spacing, hover, shadow, gradient. Integrations: shadcn/ui MCP for component search and examples. | "Design a landing page"<br>"Choose colors for my app"<br>"Fix UX issues"<br>“设计一个落地页”<br>“为我的应用选择颜色”<br>“修复 UX 问题” | Provides design systems, palettes, and typography.<br>Offers UX guidelines and checklists.<br>提供设计系统、调色板和排版。<br>提供 UX 准则和检查清单。 |
| [`vercel-react-native-skills`](./skills/vercel-react-native-skills/SKILL.md) |  | - | - |
| [`vercel-react-best-practices`](./skills/vercel-react-best-practices/SKILL.md) | React and Next.js performance optimization guidelines from Vercel Engineering. This skill should be used when writing, reviewing, or refactoring React/Next.js code to ensure optimal performance patterns. Triggers on tasks involving React components, Next.js pages, data fetching, bundle optimization, or performance improvements. | - | - |
| [`vercel-composition-patterns`](./skills/vercel-composition-patterns/SKILL.md) |  | - | - |

### Backend Development / 后端开发

| Skill | 描述 (Description) | 触发条件 (Triggers) | 效果 (Effect) |
|---|---|---|---|
| [`go-service-standards`](./skills/go-service-standards/SKILL.md) | General Go service engineering standards for backend services. Use when building, refactoring, or reviewing Go services that require strict practices (project layout, coding standards, configuration, observability, error handling, testing, CI/CD, security, dependency management, release). | - | - |
| [`express`](./skills/express/SKILL.md) | Express.js framework patterns including routing, middleware, request/response handling, and Express-specific APIs. Use when working with Express routes, middleware, or Express applications. | - | - |
| [`nodejs`](./skills/nodejs/SKILL.md) | Core Node.js backend patterns for TypeScript applications including async/await error handling, middleware concepts, configuration management, testing strategies, and layered architecture principles. Use when building Node.js backend services, APIs, or microservices. | - | - |
| [`prisma`](./skills/prisma/SKILL.md) | Prisma ORM patterns including Prisma Client usage, queries, mutations, relations, transactions, and schema management. Use when working with Prisma database operations or schema definitions. | - | - |
| [`hono-routing`](./skills/hono-routing/SKILL.md) | See details. | - | - |
| [`python-patterns`](./skills/python-patterns/SKILL.md) | Python development principles and decision-making. Framework selection, async patterns, type hints, project structure. Teaches thinking, not copying. | - | - |
| [`database-design`](./skills/database-design/SKILL.md) | Database design principles and decision-making. Schema design, indexing strategy, ORM selection, serverless databases. | - | - |
| [`docker-expert`](./skills/docker-expert/SKILL.md) | Docker containerization expert with deep knowledge of multi-stage builds, image optimization, container security, Docker Compose orchestration, and production deployment patterns. Use PROACTIVELY for Dockerfile optimization, container issues, image size problems, security hardening, networking, and orchestration challenges. | - | - |
| [`database-schema-designer`](./skills/database-schema-designer/SKILL.md) | Design robust, scalable database schemas for SQL and NoSQL databases. Provides normalization guidelines, indexing strategies, migration patterns, constraint design, and performance optimization. Ensures data integrity, query performance, and maintainable data models. |  | - |

### Authentication / 身份验证

| Skill | 描述 (Description) | 触发条件 (Triggers) | 效果 (Effect) |
|---|---|---|---|
| [`clerk-auth`](./skills/clerk-auth/SKILL.md) | See details. | - | - |
| [`better-auth`](./skills/better-auth/SKILL.md) | See details. | - | - |

### AI & SDK / AI 与 SDK

| Skill | 描述 (Description) | 触发条件 (Triggers) | 效果 (Effect) |
|---|---|---|---|
| [`ai-sdk-core`](./skills/ai-sdk-core/SKILL.md) | See details. | "Implement AI SDK"<br>"Fix AI_APICallError"<br>"Vercel AI SDK migration"<br>“实现 AI SDK”<br>“修复 AI_APICallError”<br>“Vercel AI SDK 迁移” | Provides best practices and code patterns.<br>Solves common errors.<br>提供最佳实践和代码模式。<br>解决常见错误。 |
| [`ai-sdk-ui`](./skills/ai-sdk-ui/SKILL.md) | See details. | - | - |

### Superpowers Workflow / Superpowers 工作流

| Skill | 描述 (Description) | 触发条件 (Triggers) | 效果 (Effect) |
|---|---|---|---|
| [`using-superpowers`](./skills/using-superpowers/SKILL.md) | Use when starting any conversation - establishes how to find and use skills, requiring Skill tool invocation before ANY response including clarifying questions | - | - |
| [`brainstorming`](./skills/brainstorming/SKILL.md) | You MUST use this before any creative work - creating features, building components, adding functionality, or modifying behavior. Explores user intent, requirements and design before implementation. | - | - |
| [`writing-plans`](./skills/writing-plans/SKILL.md) | Use when you have a spec or requirements for a multi-step task, before touching code | - | - |
| [`executing-plans`](./skills/executing-plans/SKILL.md) | Use when you have a written implementation plan to execute in a separate session with review checkpoints | - | - |
| [`subagent-driven-development`](./skills/subagent-driven-development/SKILL.md) | Use when executing implementation plans with independent tasks in the current session | - | - |
| [`test-driven-development`](./skills/test-driven-development/SKILL.md) | Use when implementing any feature or bugfix, before writing implementation code | - | - |
| [`systematic-debugging`](./skills/systematic-debugging/SKILL.md) | Use when encountering any bug, test failure, or unexpected behavior, before proposing fixes | - | - |
| [`verification-before-completion`](./skills/verification-before-completion/SKILL.md) | Use when about to claim work is complete, fixed, or passing, before committing or creating PRs - requires running verification commands and confirming output before making any success claims; evidence before assertions always | - | - |
| [`requesting-code-review`](./skills/requesting-code-review/SKILL.md) | Use when completing tasks, implementing major features, or before merging to verify work meets requirements | - | - |
| [`receiving-code-review`](./skills/receiving-code-review/SKILL.md) | Use when receiving code review feedback, before implementing suggestions, especially if feedback seems unclear or technically questionable - requires technical rigor and verification, not performative agreement or blind implementation | - | - |
| [`using-git-worktrees`](./skills/using-git-worktrees/SKILL.md) | Use when starting feature work that needs isolation from current workspace or before executing implementation plans - creates isolated git worktrees with smart directory selection and safety verification | - | - |
| [`finishing-a-development-branch`](./skills/finishing-a-development-branch/SKILL.md) | Use when implementation is complete, all tests pass, and you need to decide how to integrate the work - guides completion of development work by presenting structured options for merge, PR, or cleanup | - | - |
| [`dispatching-parallel-agents`](./skills/dispatching-parallel-agents/SKILL.md) | Use when facing 2+ independent tasks that can be worked on without shared state or sequential dependencies | - | - |
| [`writing-skills`](./skills/writing-skills/SKILL.md) | Use when creating new skills, editing existing skills, or verifying skills work before deployment | - | - |

### DevTools / 开发工具

| Skill | 描述 (Description) | 触发条件 (Triggers) | 效果 (Effect) |
|---|---|---|---|
| [`plan-feature`](./skills/plan-feature/SKILL.md) | Plan features and complex changes. Use when the user requests a plan/spec, says "detailed plan please", or when changes span multiple files/systems. | - | - |
| [`define-architecture`](./skills/define-architecture/SKILL.md) | Define repo layout, workflow, and full-stack architecture patterns for TypeScript apps. Use at project start or when setting conventions or designing backend services and middleware. | - | - |
| [`review-pr`](./skills/review-pr/SKILL.md) | High-signal PR review for bugs and CLAUDE.md compliance. Use before creating PRs or when reviewing changes. | - | - |
| [`optimise-seo`](./skills/optimise-seo/SKILL.md) | This skill should be used when the user asks to "improve SEO", "add sitemap.xml", "fix meta tags", "add structured data", "set canonical URLs", "improve Core Web Vitals", "audit SEO", "programmatic SEO", or "build SEO pages at scale" in a Next.js App Router app. Perform no visual redesigns. | - | - |
| [`developer-toolbox`](./skills/developer-toolbox/SKILL.md) | See details. | - | - |
| [`playwright-local`](./skills/playwright-local/SKILL.md) | See details. | - | - |
| [`webapp-testing`](./skills/webapp-testing/SKILL.md) | Toolkit for interacting with and testing local web applications using Playwright. Supports verifying frontend functionality, debugging UI behavior, capturing browser screenshots, and viewing browser logs. | - | - |
| [`mcp-builder`](./skills/mcp-builder/SKILL.md) | Guide for creating high-quality MCP (Model Context Protocol) servers that enable LLMs to interact with external services through well-designed tools. Use when building MCP servers to integrate external APIs or services, whether in Python (FastMCP) or Node/TypeScript (MCP SDK). | - | - |
| [`clean-code`](./skills/clean-code/SKILL.md) | Pragmatic coding standards - concise, direct, no over-engineering, no unnecessary comments | - | - |
| [`code-review-checklist`](./skills/code-review-checklist/SKILL.md) | Comprehensive checklist for conducting thorough code reviews covering functionality, security, performance, and maintainability | - | - |
| [`performance-profiling`](./skills/performance-profiling/SKILL.md) | Performance profiling principles. Measurement, analysis, and optimization techniques. | - | - |
| [`git-pushing`](./skills/git-pushing/SKILL.md) | Stage, commit, and push git changes with conventional commit messages. Use when user wants to commit and push changes, mentions pushing to remote, or asks to save and push their work. Also activates when user says "push changes", "commit and push", "push this", "push to github", or similar git workflow requests. | - | - |
| [`api-security-best-practices`](./skills/api-security-best-practices/SKILL.md) | Implement secure API design patterns including authentication, authorization, input validation, rate limiting, and protection against common API vulnerabilities | - | - |
| [`typescript-expert`](./skills/typescript-expert/SKILL.md) | >- | - | - |
| [`github-actions-templates`](./skills/github-actions-templates/SKILL.md) | Create production-ready GitHub Actions workflows for automated testing, building, and deploying applications. Use when setting up CI/CD with GitHub Actions, automating development workflows, or creating reusable workflow templates. | - | - |
| [`audit-website`](./skills/audit-website/SKILL.md) | Audit websites for SEO, performance, security, technical, content, and 15 other issue cateories with 150+ rules using the squirrelscan CLI. Returns LLM-optimized reports with health scores, broken links, meta tag analysis, and actionable recommendations. Use to discover and asses website or webapp issues and health. | - | - |
| [`skill-creator`](./skills/skill-creator/SKILL.md) | Guide for creating effective skills. This skill should be used when users want to create a new skill (or update an existing skill) that extends Claude's capabilities with specialized knowledge, workflows, or tool integrations. | - | - |

### Documents / 文档处理

| Skill | 描述 (Description) | 触发条件 (Triggers) | 效果 (Effect) |
|---|---|---|---|
| [`docx`](./skills/docx/SKILL.md) | Comprehensive document creation, editing, and analysis with support for tracked changes, comments, formatting preservation, and text extraction. When Claude needs to work with professional documents (.docx files) for: (1) Creating new documents, (2) Modifying or editing content, (3) Working with tracked changes, (4) Adding comments, or any other document tasks | - | - |
| [`pdf`](./skills/pdf/SKILL.md) | Comprehensive PDF manipulation toolkit for extracting text and tables, creating new PDFs, merging/splitting documents, and handling forms. When Claude needs to fill in a PDF form or programmatically process, generate, or analyze PDF documents at scale. | - | - |
| [`pptx`](./skills/pptx/SKILL.md) | Presentation creation, editing, and analysis. When Claude needs to work with presentations (.pptx files) for: (1) Creating new presentations, (2) Modifying or editing content, (3) Working with layouts, (4) Adding comments or speaker notes, or any other presentation tasks | - | - |
| [`xlsx`](./skills/xlsx/SKILL.md) | Comprehensive spreadsheet creation, editing, and analysis with support for formulas, formatting, data analysis, and visualization. When Claude needs to work with spreadsheets (.xlsx, .xlsm, .csv, .tsv, etc) for: (1) Creating new spreadsheets with formulas and formatting, (2) Reading or analyzing data, (3) Modify existing spreadsheets while preserving formulas, (4) Data analysis and visualization in spreadsheets, or (5) Recalculating formulas | - | - |
| [`humanizer`](./skills/humanizer/SKILL.md) | See details. | - | - |
| [`doc-coauthoring`](./skills/doc-coauthoring/SKILL.md) | Guide users through a structured workflow for co-authoring documentation. Use when user wants to write documentation, proposals, technical specs, decision docs, or similar structured content. This workflow helps users efficiently transfer context, refine content through iteration, and verify the doc works for readers. Trigger when user mentions writing docs, creating proposals, drafting specs, or similar documentation tasks. | - | - |
| [`internal-comms`](./skills/internal-comms/SKILL.md) | A set of resources to help me write all kinds of internal communications, using the formats that my company likes to use. Claude should use this skill whenever asked to write some sort of internal communications (status reports, leadership updates, 3P updates, company newsletters, FAQs, incident reports, project updates, etc.). | - | - |

### Creative & Design / 创意与设计

| Skill | 描述 (Description) | 触发条件 (Triggers) | 效果 (Effect) |
|---|---|---|---|
| [`canvas-design`](./skills/canvas-design/SKILL.md) | Create beautiful visual art in .png and .pdf documents using design philosophy. You should use this skill when the user asks to create a poster, piece of art, design, or other static piece. Create original visual designs, never copying existing artists' work to avoid copyright violations. | - | - |
| [`algorithmic-art`](./skills/algorithmic-art/SKILL.md) | Creating algorithmic art using p5.js with seeded randomness and interactive parameter exploration. Use this when users request creating art using code, generative art, algorithmic art, flow fields, or particle systems. Create original algorithmic art rather than copying existing artists' work to avoid copyright violations. | - | - |
| [`theme-factory`](./skills/theme-factory/SKILL.md) | Toolkit for styling artifacts with a theme. These artifacts can be slides, docs, reportings, HTML landing pages, etc. There are 10 pre-set themes with colors/fonts that you can apply to any artifact that has been creating, or can generate a new theme on-the-fly. | - | - |
| [`frontend-design`](./skills/frontend-design/SKILL.md) | Create distinctive, production-grade frontend interfaces with high design quality. Use this skill when the user asks to build web components, pages, artifacts, posters, or applications (examples include websites, landing pages, dashboards, React components, HTML/CSS layouts, or when styling/beautifying any web UI). Generates creative, polished code and UI design that avoids generic AI aesthetics. | - | - |
| [`brand-guidelines`](./skills/brand-guidelines/SKILL.md) | Applies Anthropic's official brand colors and typography to any sort of artifact that may benefit from having Anthropic's look-and-feel. Use it when brand colors or style guidelines, visual formatting, or company design standards apply. | - | - |
| [`slack-gif-creator`](./skills/slack-gif-creator/SKILL.md) | Knowledge and utilities for creating animated GIFs optimized for Slack. Provides constraints, validation tools, and animation concepts. Use when users request animated GIFs for Slack like "make me a GIF of X doing Y for Slack. | - | - |
| [`web-artifacts-builder`](./skills/web-artifacts-builder/SKILL.md) | Suite of tools for creating elaborate, multi-component claude.ai HTML artifacts using modern frontend web technologies (React, Tailwind CSS, shadcn/ui). Use for complex artifacts requiring state management, routing, or shadcn/ui components - not for simple single-file HTML/JSX artifacts. | - | - |

### General / 通用

| Skill | 描述 (Description) | 触发条件 (Triggers) | 效果 (Effect) |
|---|---|---|---|
| [`chinese-default`](./skills/chinese-default/SKILL.md) | Always respond in Simplified Chinese for natural language output. | - | - |

### Other / 其他

| Skill | 描述 (Description) | 触发条件 (Triggers) | 效果 (Effect) |
|---|---|---|---|
| [`git-advanced-workflows`](./skills/git-advanced-workflows/SKILL.md) | Master advanced Git workflows including rebasing, cherry-picking, bisect, worktrees, and reflog to maintain clean history and recover from any situation. Use when managing complex Git histories, collaborating on feature branches, or troubleshooting repository issues. | - | - |
| [`multi-tenant-platform-architecture`](./skills/multi-tenant-platform-architecture/SKILL.md) | Cloudflare-first architecture guidance for multi-tenant platforms where tenants own their space. Use when defining domain strategy, tenant isolation, Workers for Platforms routing, custom domains, and plan/limit mapping for untrusted tenant code or UGC. | - | - |
| [`tailwindcss`](./skills/tailwindcss/SKILL.md) | Tailwind CSS v4 utility-first styling patterns including responsive design, dark mode, and custom configuration. Use when styling with Tailwind, adding utility classes, configuring Tailwind, setting up dark mode, or customizing the theme. | - | - |
| [`template`](./skills/template/SKILL.md) | Replace with description of the skill and when Claude should use it. | - | - |

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

## 贡献与社区

欢迎贡献代码！请阅读 [贡献指南](CONTRIBUTING.md) 了解如何添加新 Skill。
本项目遵守 [行为准则](CODE_OF_CONDUCT.md)。

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
- [obra/superpowers](https://github.com/obra/superpowers) - 完整的 Agent 软件开发工作流

## 许可证

各 skill 保留其原始许可证。查看各 skill 目录中的 LICENSE 文件。
