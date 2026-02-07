# Contributing to dotfiles-skills

Thank you for your interest in contributing! We welcome new skills and improvements.

## How to Add a New Skill

1.  Create a new folder in `skills/`: `skills/my-new-skill`
2.  Create a `SKILL.md` file in that folder. This is required.
    - Format:
      ```markdown
      ---
      name: my-new-skill
      description: Short description
      ---
      # My New Skill
      ... details ...
      ```
3.  Add any necessary resources or scripts within that folder.
4.  Test your skill locally.
5.  Run `./install.sh` to verify it can be installed.
6.  Submit a Pull Request.

## Pull Request Process

1.  Fork the repository.
2.  Create a branch for your changes.
3.  Commit your changes.
4.  Push to your fork and submit a PR.
5.  Ensure you have updated the README if necessary.

## Code Style

- Keep skills self-contained in their directories.
- Use clear and descriptive names.
- Ensure `SKILL.md` is valid Markdown.
