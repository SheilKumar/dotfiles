# nvim + tmux cheatsheet

> Leader key is `<Space>`. Tmux prefix is `Option+s` on Mac and `Alt+s` on Linux.

---

## The core idea

VSCode makes common things easy. This setup makes _fast_ things fast. The payoff is:
- **No mouse required** for navigation — your hands never leave the keyboard
- **Telescope** replaces the file tree, command palette, and global search
- **LSP jumps** replace "go to definition" clicks
- **vim-tmux-navigator** makes nvim splits and tmux panes feel like one unified space

---

## Moving inside a file

### Basic but essential — use these constantly

| Key | Action |
|-----|--------|
| `w` / `b` | Next / previous word start |
| `e` / `ge` | Next / previous word end |
| `0` / `$` | Start / end of line |
| `^` | First non-blank character of line |
| `gg` / `G` | Top / bottom of file |
| `{` / `}` | Jump up / down by blank-line-separated block |
| `Ctrl+d` / `Ctrl+u` | Half-page down / up (better than scrolling) |
| `H` / `M` / `L` | Jump to top / middle / bottom of screen |
| `zz` | Center the screen on your cursor |

### Precision line jumps

| Key | Action |
|-----|--------|
| `5j` / `12k` | Move N lines down / up — **relative numbers show the exact count on every line** |
| `f{char}` | Jump to next `{char}` on the current line |
| `t{char}` | Jump _before_ next `{char}` on the current line |
| `F{char}` / `T{char}` | Same, backwards |
| `;` / `,` | Repeat last `f/t` forward / backward |
| `%` | Jump to matching bracket / paren / brace |

> **Tip:** `f` + `;` is how you hop along a line without counting. Way faster than holding `l`.

### Searching within the file

| Key | Action |
|-----|--------|
| `/pattern` | Search forward |
| `?pattern` | Search backward |
| `n` / `N` | Next / previous match |
| `*` / `#` | Search word under cursor forward / backward |
| `<Esc>` | Clear search highlights |
| `<leader>/` | **Telescope fuzzy search in current buffer** — use this for quick jumps |

> **Tip:** `*` then `n/N` is the fastest way to hop between usages of a variable in the current file.

### Jump history — massively underused

| Key | Action |
|-----|--------|
| `Ctrl+o` | Jump back to previous location |
| `Ctrl+i` | Jump forward |
| `''` (two apostrophes) | Jump back to where you last jumped _from_ |
| `gi` | Jump back to where you last exited insert mode |

> **Tip:** Every time you use `grd` (go to definition), `Ctrl+o` brings you back. This is your "back button."

### Marks

| Key | Action |
|-----|--------|
| `ma` | Set mark `a` at current position |
| `` `a `` | Jump to exact position of mark `a` |
| `'a` | Jump to the line of mark `a` |
| `` `. `` | Jump to last change position |

Use lowercase marks `a-z` within a file.

---

## Editing at speed

### Text objects — the grammar of vim

The pattern is: `{verb}{modifier}{object}`. Examples:

| Command | Meaning |
|---------|---------|
| `ciw` | **C**hange **i**nside **w**ord |
| `ca(` | **C**hange **a**round `(...)` including parens |
| `di"` | **D**elete **i**nside `"..."` |
| `ya{` | **Y**ank **a**round `{...}` including braces |
| `vi[` | **V**isually select **i**nside `[...]` |

**mini.ai extras** (treesitter-aware):

| Command | Meaning |
|---------|---------|
| `vif` | Select inside function |
| `vic` | Select inside class |
| `aa` / `ii` | Around/inside next text object (skips to next one) |

### Surround (mini.surround)

| Command | Meaning |
|---------|---------|
| `saiw)` | **S**urround **a**dd **i**nner **w**ord with `()` |
| `sd'` | **S**urround **d**elete `'...'` quotes |
| `sr)"` | **S**urround **r**eplace `)` with `"` |

### Operators + motions

| Command | Meaning |
|---------|---------|
| `dw` | Delete to next word |
| `d$` | Delete to end of line |
| `c}` | Change to end of paragraph |
| `>}` | Indent to end of paragraph |
| `=G` | Auto-indent from cursor to end of file |
| `.` | Repeat last change — extremely powerful |

---

## Moving between files

### Telescope — your command palette, file finder, and grep

| Key | Action |
|-----|--------|
| `<leader>sf` | **Find files** by name (fuzzy) |
| `<leader>sg` | **Live grep** — search by content across all files |
| `<leader>sw` | Grep the **word under cursor** across all files |
| `<leader><leader>` | **Switch open buffers** — fast tab switching |
| `<leader>s.` | **Recent files** — files you've had open |
| `<leader>/` | Fuzzy search in **current buffer** |
| `<leader>s/` | Live grep in **open files only** |
| `<leader>sr` | **Resume** last Telescope search |
| `<leader>sd` | Search diagnostics |
| `<leader>ss` | Search/select Telescope pickers |
| `<leader>sh` | Search help tags |
| `<leader>sk` | Search keymaps |
| `<leader>sc` | Search commands |
| `<leader>sn` | Search Neovim config files |

> **Tip:** `<leader>sg` is your "find in project." `<leader>sw` with cursor on a function name is your "find all usages." Together they replace the VSCode sidebar search entirely.

### Neo-tree — file explorer

| Key | Action |
|-----|--------|
| `\` | **Toggle Neo-tree** (reveals current file) |
| `\` | Close Neo-tree (same key while inside it) |

> **Tip:** Neo-tree is there when you need a visual overview, but Telescope is faster for jumping to a known file. Use Neo-tree to explore unfamiliar directories.

### LSP navigation — jump by meaning, not by text

These only work when an LSP is attached (check bottom-right for LSP status):

| Key | Action |
|-----|--------|
| `grd` | **Go to definition** |
| `gri` | Go to implementation |
| `grt` | Go to type definition |
| `grr` | **Find all references** (opens Telescope) |
| `grD` | Go to declaration (e.g. C header) |
| `gO` | **Document symbols** — outline of current file |
| `gW` | **Workspace symbols** — search across entire project |
| `Ctrl+o` | Jump back after any `gr*` jump |
| `grn` | Rename symbol (renames across all files) |
| `gra` | Code actions (fix imports, refactor, etc.) |
| `<leader>th` | Toggle inlay hints |

> **Tip:** `gO` is your file outline. Hit it, type to filter, jump to the function. Faster than scrolling.

### Splits and windows

| Key | Action |
|-----|--------|
| `:vs` | Vertical split (or `:vsp filename`) |
| `:sp` | Horizontal split (or `:sp filename`) |
| `Ctrl+h/j/k/l` | Move between splits — **also works across tmux panes** |
| `Ctrl+w =` | Equalize split sizes |
| `Ctrl+w _` | Maximize current split height |
| `Ctrl+w \|` | Maximize current split width |

### Quickfix list (diagnostics + search results)

| Key | Action |
|-----|--------|
| `<leader>q` | Open diagnostics in quickfix list |
| `<leader>sd` | Search diagnostics with Telescope |
| `[d` / `]d` | Previous / next diagnostic (auto-shows float) |
| `:cnext` / `:cprev` | Navigate quickfix entries |

---

## tmux

### Sessions, windows, panes

| Key | Action |
|-----|--------|
| `ß c` | New window |
| `ß ,` | Rename current window |
| `ß 1-9` | Switch to window by number (windows start at 1) |
| `ß n` / `ß p` | Next / previous window |
| `ß \|` | Split pane **vertically** (new pane to the right) |
| `ß _` | Split pane **horizontally** (new pane below) |
| `ß x` | Kill current pane |
| `ß z` | **Zoom** current pane (toggle fullscreen) |
| `ß $` | Rename session |
| `ß s` | List and switch sessions |
| `ß d` | Detach from session |
| `ß r` | Reload tmux config |

### Pane navigation — seamless with nvim

`Ctrl+h/j/k/l` navigates **both** nvim splits and tmux panes — no prefix needed. vim-tmux-navigator handles the handoff transparently.

### Copy mode (scrollback)

| Key | Action |
|-----|--------|
| `ß [` | Enter copy mode (scroll up through output) |
| `q` | Exit copy mode |
| `Ctrl+u` / `Ctrl+d` | Scroll in copy mode |

---

## Git (gitsigns)

| Key | Action |
|-----|--------|
| `]c` / `[c` | Next / previous changed hunk |
| `<leader>hp` | Preview hunk diff |
| `<leader>hi` | Preview hunk inline |
| `<leader>hs` | Stage hunk |
| `<leader>hr` | Reset (undo) hunk |
| `<leader>hS` | Stage entire buffer |
| `<leader>hR` | Reset entire buffer |
| `<leader>hb` | Blame current line (full) |
| `<leader>hd` | Diff against index |
| `<leader>hD` | Diff against last commit |
| `<leader>hq` | Send hunks in this file to quickfix |
| `<leader>hQ` | Send all hunks in repo to quickfix |
| `<leader>tb` | Toggle blame column |
| `<leader>tw` | Toggle intra-line word diff |
| `ih` | Text object: inside hunk (use with `v`, `d`, etc.) |

---

## Diagnostics and quickfix

| Key | Action |
|-----|--------|
| `[d` / `]d` | Jump to prev / next diagnostic (float auto-opens) |
| `<leader>sd` | Search all diagnostics with Telescope |
| `<leader>q` | Send diagnostics to quickfix list |

---

## Workflow patterns that beat VSCode

**Finding a function across the project:**
`<leader>sg` → type function name → `Enter` to open, or `Ctrl+q` to send all results to quickfix

**Jumping to a definition and back:**
Cursor on symbol → `grd` → read the code → `Ctrl+o` → back to where you were

**Renaming a symbol everywhere:**
Cursor on symbol → `grn` → type new name → `Enter`

**Switching between two files you're working on:**
Open both → `<leader><leader>` → fuzzy filter → `Enter`. Or `Ctrl+^` to flip between last two buffers instantly.

**Replacing a word everywhere in the file:**
`*` to search word under cursor → `cgn` → type replacement → `Esc` → `.` to repeat for each occurrence

**Editing inside a function without selecting it manually:**
`cif` (change inside function) — mini.ai handles the text object

---

## Which-key

Press `<leader>` and pause — a menu will appear showing all available keymaps grouped by prefix. Use it when you forget a key. Press `<leader>sk` to search all keymaps with Telescope.
