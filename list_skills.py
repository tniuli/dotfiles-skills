#!/usr/bin/env python3
import os
import sys

def get_skill_info(skill_dir):
    skill_md = os.path.join(skill_dir, 'SKILL.md')
    if not os.path.exists(skill_md):
        return None
    
    info = {'id': os.path.basename(skill_dir), 'name': '', 'description': ''}
    
    try:
        with open(skill_md, 'r', encoding='utf-8') as f:
            lines = f.readlines()
            
        in_frontmatter = False
        if lines and lines[0].strip() == '---':
            in_frontmatter = True
            lines = lines[1:]
        
        description_lines = []
        reading_description = False
        
        for line in lines:
            if line.strip() == '---':
                break
            
            if reading_description:
                # If line starts with a key (no indentation), stop
                if line and line[0] != ' ' and ':' in line:
                    break
                description_lines.append(line.strip())
            
            elif line.startswith('name:'):
                info['name'] = line.split(':', 1)[1].strip().strip('"\'')
                
            elif line.startswith('description:'):
                val = line.split(':', 1)[1].strip()
                if val == '|' or val == '>':
                    reading_description = True
                else:
                    info['description'] = val.strip('"\'')
                    
        if description_lines:
            info['description'] = ' '.join(description_lines)
            
        if not info['name']:
            info['name'] = info['id']
            
        return info
    except Exception:
        return None

def main():
    script_dir = os.path.dirname(os.path.abspath(__file__))
    # Handle if script is in root or scripts/
    if os.path.basename(script_dir) == 'scripts':
        skills_dir = os.path.join(script_dir, '../skills')
    else:
        skills_dir = os.path.join(script_dir, 'skills')
    
    skills_dir = os.path.abspath(skills_dir)
        
    if not os.path.isdir(skills_dir):
        # Fallback to CWD
        skills_dir = 'skills'
        if not os.path.isdir(skills_dir):
            print(f"Skills directory not found at {skills_dir}")
            return
        
    skills = []
    for d in sorted(os.listdir(skills_dir)):
        path = os.path.join(skills_dir, d)
        if os.path.isdir(path):
            info = get_skill_info(path)
            if info:
                skills.append(info)
    
    # Print table
    print(f"\033[1;34m{'SKILL ID':<35} | {'DESCRIPTION'}\033[0m")
    print("-" * 100)
    for s in skills:
        desc = s['description']
        # Remove newlines/extra spaces
        desc = ' '.join(desc.split())
        if len(desc) > 60:
            desc = desc[:57] + "..."
        print(f"{s['id']:<35} | {desc}")
    print("-" * 100)
    print(f"\033[1;33mTotal: {len(skills)} skills\033[0m")

if __name__ == '__main__':
    main()
