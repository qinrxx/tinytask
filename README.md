# tiny-task

A dead simple to-do list for the Linux terminal. One bash script, no dependencies.

```
  1. [ ] buy milk
  2. [x] fix the printer
  3. [ ] call mum
     1/3 done
```

## Install (Ubuntu / Lubuntu / Debian)

```bash
git clone https://github.com/Qinrxx/tiny-task.git
cd tiny-task
./install.sh
```

That copies the script to `~/.local/bin/task`. If the installer says that folder
isn't on your PATH:

```bash
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc && source ~/.bashrc
```

## Usage

| Command | What it does |
| --- | --- |
| `task` | list all tasks |
| `task add <text>` | add a task |
| `task done <n>` | tick task number n |
| `task undo <n>` | untick task number n |
| `task rm <n>` | delete task number n |
| `task clear` | delete all ticked tasks |
| `task nuke` | delete everything |
| `task help` | show help |

Example:

```bash
task add buy milk
task add "fix the printer"
task
task done 1
task clear
```

## Where are my tasks stored?

Plain text at `~/.tiny-task.txt`, one task per line. Edit it by hand if you like.
Point it somewhere else with the `TINY_TASK_FILE` environment variable:

```bash
TINY_TASK_FILE=~/work-tasks.txt task add ship the release
```

## Uninstall

```bash
rm ~/.local/bin/task
```

## License

MIT
