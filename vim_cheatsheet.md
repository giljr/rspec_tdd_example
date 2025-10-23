# Vim Cheat Sheet for Rails in tmux

## 1. Modes
- Normal mode: Esc → Navigate, issue commands
- Insert mode: i → Type/edit text
- Command mode: : → Enter commands like save/quit

## 2. Saving & Exiting
- Write & Quit: `:wq` → Write your changes, then quit
- Quit without saving: `:q!` → Force quit without writing
- Just quit: `:q` → Quit only if nothing changed

## 3. Basic Navigation
- h → left
- j → down
- k → up
- l → right
- gg → go to top
- G → go to bottom

## 4. Quick Editing
- i → insert at cursor
- a → append after cursor
- x → delete character under cursor
- dd → delete current line

## 5. Bonus for Rails
- Open file: `vim Gemfile`
- Split panes: Ctrl+b " (horizontal), Ctrl+b % (vertical)
- Switch panes: Ctrl+b + arrow keys

## How to Save to PDF
- Step 1 — Install Pandoc
```bash
sudo apt install pandoc -y
```
- Step 2 — Create a Markdown file
Example: vim_cheatsheet.md
- Step 3 — Convert Markdown to PDF
```bash
pandoc vim_cheatsheet.md -o vim_cheatsheet.pdf --pdf-engine=xelatex
```