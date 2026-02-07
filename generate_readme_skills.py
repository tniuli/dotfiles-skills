#!/usr/bin/env python3
import os
import re

CATEGORIES = {
    'Frontend Development / 前端开发': ['react-best-practices', 'web-design-guidelines', 'implement-frontend', 'design-ui', 'audit-ui', 'ui-animation', 'nextjs', 'react', 'tailwind-v4-shadcn', 'tailwind-patterns', 'shadcn', 'tanstack-query', 'tanstack-router', 'tanstack-table', 'zustand-state-management', 'react-hook-form-zod', 'motion', 'mui', 'ui-ux-pro-max', 'vercel-react-native-skills', 'vercel-react-best-practices', 'vercel-composition-patterns'],
    'Backend Development / 后端开发': ['go-service-standards', 'express', 'nodejs', 'prisma', 'hono-routing', 'python-patterns', 'database-design', 'docker-expert', 'database-schema-designer'],
    'Authentication / 身份验证': ['clerk-auth', 'better-auth'],
    'AI & SDK / AI 与 SDK': ['ai-sdk-core', 'ai-sdk-ui'],
    'Superpowers Workflow / Superpowers 工作流': ['using-superpowers', 'brainstorming', 'writing-plans', 'executing-plans', 'subagent-driven-development', 'test-driven-development', 'systematic-debugging', 'verification-before-completion', 'requesting-code-review', 'receiving-code-review', 'using-git-worktrees', 'finishing-a-development-branch', 'dispatching-parallel-agents', 'writing-skills'],
    'DevTools / 开发工具': ['plan-feature', 'define-architecture', 'review-pr', 'optimise-seo', 'developer-toolbox', 'playwright-local', 'webapp-testing', 'mcp-builder', 'clean-code', 'code-review-checklist', 'performance-profiling', 'git-pushing', 'api-security-best-practices', 'typescript-expert', 'github-actions-templates', 'audit-website', 'skill-creator'],
    'Documents / 文档处理': ['docx', 'pdf', 'pptx', 'xlsx', 'humanizer', 'doc-coauthoring', 'internal-comms'],
    'Creative & Design / 创意与设计': ['canvas-design', 'algorithmic-art', 'theme-factory', 'frontend-design', 'brand-guidelines', 'slack-gif-creator', 'web-artifacts-builder'],
    'General / 通用': ['chinese-default', 'template-skill']
}

def parse_skill_md(file_path):
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()

    info = {
        'name': os.path.basename(os.path.dirname(file_path)),
        'description': '',
        'triggers': [],
        'effect': []
    }

    # Extract name/desc from frontmatter
    frontmatter_match = re.match(r'^---\n(.*?)\n---', content, re.DOTALL)
    if frontmatter_match:
        fm = frontmatter_match.group(1)
        for line in fm.split('\n'):
            if line.startswith('description:'):
                val = line.split(':', 1)[1].strip()
                if val == '|' or val == '>':
                    info['description'] = "See details."
                else:
                    info['description'] = val.strip('"\'')
            if line.startswith('name:'):
                info['name'] = line.split(':', 1)[1].strip()

    # Extract Triggers
    triggers_match = re.search(r'## (Triggers|触发条件).*?\n(.*?)(?=\n## |$)', content, re.DOTALL | re.IGNORECASE)
    if triggers_match:
        triggers_text = triggers_match.group(2)
        info['triggers'] = [line.strip('- ').strip() for line in triggers_text.split('\n') if line.strip().startswith('-')]

    # Extract Effect
    effect_match = re.search(r'## (Effect|效果).*?\n(.*?)(?=\n## |$)', content, re.DOTALL | re.IGNORECASE)
    if effect_match:
        effect_text = effect_match.group(2)
        info['effect'] = [line.strip('- ').strip() for line in effect_text.split('\n') if line.strip().startswith('-')]

    return info

def generate_markdown(skills_map, lang='zh'):
    if lang == 'zh':
        title = "## Skills 概览"
        headers = "| Skill | 描述 (Description) | 触发条件 (Triggers) | 效果 (Effect) |"
        other = "### Other / 其他"
    else:
        title = "## Skills Overview"
        headers = "| Skill | Description | Triggers | Effect |"
        other = "### Other"

    md = f"{title}\n\n"
    
    processed_skills = set()
    
    for category_key, skill_names in CATEGORIES.items():
        if lang == 'en':
            cat_name = category_key.split(' / ')[0]
        else:
            cat_name = category_key
            
        category_skills = []
        for name in skill_names:
            if name in skills_map:
                category_skills.append(skills_map[name])
                processed_skills.add(name)
        
        if category_skills:
            md += f"### {cat_name}\n\n"
            md += f"{headers}\n"
            md += "|---|---|---|---|\n"
            for skill in category_skills:
                name_link = f"[`{skill['name']}`](./skills/{skill['name']}/SKILL.md)"
                desc = skill['description'].replace('|', '\|')
                triggers = '<br>'.join(skill['triggers']) if skill['triggers'] else '-'
                effect = '<br>'.join(skill['effect']) if skill['effect'] else '-'
                md += f"| {name_link} | {desc} | {triggers} | {effect} |\n"
            md += "\n"
            
    # Process uncategorized
    uncategorized = []
    for name, skill in skills_map.items():
        if name not in processed_skills:
            uncategorized.append(skill)
            
    if uncategorized:
        md += f"{other}\n\n"
        md += f"{headers}\n"
        md += "|---|---|---|---|\n"
        for skill in uncategorized:
            name_link = f"[`{skill['name']}`](./skills/{skill['name']}/SKILL.md)"
            desc = skill['description'].replace('|', '\|')
            triggers = '<br>'.join(skill['triggers']) if skill['triggers'] else '-'
            effect = '<br>'.join(skill['effect']) if skill['effect'] else '-'
            md += f"| {name_link} | {desc} | {triggers} | {effect} |\n"
        md += "\n"
            
    return md

def main():
    root = 'skills'
    skills_map = {}
    
    for d in sorted(os.listdir(root)):
        path = os.path.join(root, d)
        if os.path.isdir(path) and os.path.exists(os.path.join(path, 'SKILL.md')):
            try:
                info = parse_skill_md(os.path.join(path, 'SKILL.md'))
                skills_map[d] = info
                skills_map[d]['name'] = d
            except Exception as e:
                print(f"Error parsing {d}: {e}")

    # Update README.md
    new_content_zh = generate_markdown(skills_map, 'zh')
    with open('README.md', 'r', encoding='utf-8') as f:
        readme = f.read()
    pattern_zh = r'(## Skills 概览\n)([\s\S]*?)(?=\n## 目录结构)'
    if re.search(pattern_zh, readme):
        updated_readme = re.sub(pattern_zh, new_content_zh.strip() + '\n', readme)
        with open('README.md', 'w', encoding='utf-8') as f:
            f.write(updated_readme)
        print("Updated README.md")
    else:
        print("Could not find section to replace in README.md")

    # Update README_EN.md
    new_content_en = generate_markdown(skills_map, 'en')
    with open('README_EN.md', 'r', encoding='utf-8') as f:
        readme_en = f.read()
    pattern_en = r'(## Skills Overview\n)([\s\S]*?)(?=\n## Directory Structure)'
    if re.search(pattern_en, readme_en):
        updated_readme_en = re.sub(pattern_en, new_content_en.strip() + '\n', readme_en)
        with open('README_EN.md', 'w', encoding='utf-8') as f:
            f.write(updated_readme_en)
        print("Updated README_EN.md")

if __name__ == '__main__':
    main()
