filtered and logically ordered tmux workflow, keeping only the relevant and correct commands — cleaned up and organized for clarity:

🧭 Logical tmux Workflow

1️⃣ Create a new session
```bash
tmux new -s rails
```

2️⃣ List active sessions
```bash
tmux ls
```

3️⃣ Attach to an existing session

```bash
tmux attach -t rails
```
(alternatively, this also works)
```bash
tmux attach rails
```

4️⃣ Reload your tmux configuration
```bash
tmux source-file ~/.tmux.conf
```

5️⃣ Show the current tmux prefix key

```bash
tmux show -g | grep prefix
```

6️⃣ Exit the tmux session (from inside it)

```bash
exit
```

✅ Final Clean List

```bash
tmux new -s rails
tmux ls
tmux attach -t rails
tmux source-file ~/.tmux.conf
tmux show -g | grep prefix
exit
```

That`s it ! Now 🖨️ !

## How to Save to PDF
- Step 1 — Install Pandoc
```bash
sudo apt install pandoc -y
```
- Step 2 — Create a Markdown file
Example: vim_cheatsheet.md
- Step 3 — Convert Markdown to PDF
```bash
pandoc tmux_cmmds.md -o tmux_cmmds.pdf --pdf-engine=xelatex
```