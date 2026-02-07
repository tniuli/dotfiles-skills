#!/usr/bin/env python3
import os
import json
import shutil
import subprocess
import tempfile
import sys

def main():
    script_dir = os.path.dirname(os.path.abspath(__file__))
    # Assuming script is in root, skills dir is ./skills
    skills_dir = os.path.join(script_dir, 'skills')
    sources_path = os.path.join(skills_dir, 'sources.json')

    if not os.path.exists(sources_path):
        print(f"No sources.json found at {sources_path}")
        return

    with open(sources_path, 'r') as f:
        try:
            sources = json.load(f)
        except json.JSONDecodeError:
            print("Error parsing sources.json")
            return

    print(f"Found {len(sources)} skills with upstream sources.")

    for skill_id, config in sources.items():
        repo_url = config.get('url')
        if not repo_url:
            continue
            
        print(f"Updating {skill_id} from {repo_url}...")
            
        branch = config.get('branch', 'main')
        repo_subpath = config.get('path', '')
        
        target_skill_dir = os.path.join(skills_dir, skill_id)
        
        # Create temp dir
        with tempfile.TemporaryDirectory() as temp_dir:
            try:
                subprocess.check_call(['git', 'clone', '--depth', '1', '-b', branch, repo_url, temp_dir], 
                                      stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
            except subprocess.CalledProcessError:
                try:
                    # Fallback to default branch
                    subprocess.check_call(['git', 'clone', '--depth', '1', repo_url, temp_dir],
                                          stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
                except:
                    print(f"  ❌ Failed to clone {repo_url}")
                    continue

            source_path = os.path.join(temp_dir, repo_subpath)
            if not os.path.exists(source_path):
                print(f"  ❌ Path {repo_subpath} not found in repo.")
                continue
                
            # If target exists, remove it
            if os.path.exists(target_skill_dir):
                shutil.rmtree(target_skill_dir)
            
            # Copy from source to target
            shutil.copytree(source_path, target_skill_dir, ignore=shutil.ignore_patterns('.git', '.github', '.DS_Store'))
            print(f"  ✓ Successfully updated {skill_id}")

if __name__ == '__main__':
    main()
