# dotfiles-skills

个人 Agent Skills 集合，用于 Claude Code、Codex CLI 和 Cursor。

## 快速安装

```bash
git clone git@github.com:tniuli/dotfiles-skills.git ~/dotfiles-skills
cd ~/dotfiles-skills
./install.sh
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

### 后端开发 (Backend)

| Skill | 描述 |
|-------|------|
| `go-service-standards` | Go 后端服务工程标准 |
| `express` | Express.js 框架 |
| `nodejs` | Node.js 开发模式 |
| `prisma` | Prisma ORM |
| `hono-routing` | Hono 路由框架 |

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

### 文档处理 (Documents)

| Skill | 描述 |
|-------|------|
| `docx` | Word 文档处理 |
| `pdf` | PDF 处理 |
| `pptx` | PowerPoint 处理 |
| `xlsx` | Excel 处理 |

### 创意设计 (Creative)

| Skill | 描述 |
|-------|------|
| `canvas-design` | 视觉艺术设计 |
| `algorithmic-art` | 生成艺术 |
| `theme-factory` | 主题样式工具包 |
| `frontend-design` | 前端设计 |
| `brand-guidelines` | 品牌指南 |
| `slack-gif-creator` | Slack GIF 创建 |

## 目录结构

```
dotfiles-skills/
├── install.sh           # 安装脚本
├── README.md            # 本文件
├── .gitignore
└── skills/              # 所有 skills
    ├── react-best-practices/
    ├── go-service-standards/
    ├── ...
    └── zustand-state-management/
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

## 许可证

各 skill 保留其原始许可证。查看各 skill 目录中的 LICENSE 文件。
