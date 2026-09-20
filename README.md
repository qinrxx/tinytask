# tinytask

A tiny mouse & keyboard macro recorder for Linux — the same idea as TinyTask on
Windows. Record what you do, play it back as many times as you like. One Python
file, one dependency.

```
tinytask  F9 record/stop   F10 play   F12 quit
```

## Install (Lubuntu / Ubuntu / Debian)

```bash
git clone https://github.com/Qinrxx/tinytask.git
cd tinytask
./install.sh
```

The installer pulls in `python3-pynput` and copies the script to
`~/.local/bin/tinytask`. If it says that folder isn't on your PATH:

```bash
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc && source ~/.bashrc
```

**X11 only.** Lubuntu's default LXQt session is X11, so it works out of the box.
If you picked a Wayland session at login, log out and choose the Xorg one —
Wayland blocks programs from watching and faking input on purpose. Check with
`echo $XDG_SESSION_TYPE`.

## Use it like TinyTask (hotkeys)

```bash
tinytask
```

Then, anywhere on your desktop:

| Key | What it does |
| --- | --- |
| **F9** | start recording — press again to stop and save |
| **F10** | play the recording back |
| **F12** | quit (and stops playback mid-run) |

Everything is recorded: mouse movement, clicks, scrolling, and every key.
The recording is saved to `~/.tinytask/last.json`.

## Use it from the command line (named macros, repeats, speed)

```bash
tinytask record login      # records until you press F9, saves as "login"
tinytask play login        # play it once
tinytask play login -n 10  # play it 10 times
tinytask play login --loop # keep going until you press F12
tinytask play login -s 2   # play at double speed (0.5 = half speed)
tinytask list              # show saved macros, their size and length
```

Named macros live in `~/.tinytask/`. You can also give a real path
(`tinytask play ~/Desktop/thing.json`) and move those files between machines —
they're plain JSON.

## Worked example

Say you want to click a button once a second, forever:

1. `tinytask record clicker`
2. Move to the button, click it, wait a second, click it again.
3. Press **F9** to stop.
4. `tinytask play clicker --loop`
5. Press **F12** when you've had enough.

## Things worth knowing

- Playback repeats the exact screen coordinates you recorded, so move windows
  back where they were first — or maximise them before recording.
- **F12 always stops playback**, so avoid pressing F12 inside a macro.
- A macro that types passwords will store them in plain text in
  `~/.tinytask/`. Don't record those.
- Mouse movement is sampled every ~12 ms to keep files small.
- Set `TINYTASK_DIR` to keep macros somewhere other than `~/.tinytask`.

## Uninstall

```bash
rm ~/.local/bin/tinytask && rm -rf ~/.tinytask
```

## License

MIT
