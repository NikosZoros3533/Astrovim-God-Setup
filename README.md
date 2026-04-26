# ⚡ AstroNvim Developer Setup (React / JS Focus)

A fully customized AstroNvim configuration optimized for:

- React / JavaScript / TypeScript
- Fast development workflow
- AI-assisted coding (Copilot + Blink)
- Clean LSP + auto-import workflow
- Structural editing via Treesitter

---

# 🚀 Installation (1 Command Setup)

## 🪟 Windows

```bash
git clone https://github.com/YOUR_USERNAME/astronvim-config %LOCALAPPDATA%\nvim
nvim
```

## 🐧 Linux / WSL

```bash
git clone https://github.com/YOUR_USERNAME/astronvim-config ~/.config/nvim
nvim
```

---

## ⚠️ Requirements

Install BEFORE first launch:

### Core

- Neovim (latest stable)
- Git
- Node.js (for LSP / TS support)

### Recommended tools

- ripgrep (search)
- lazygit (git UI)

### Windows only (IMPORTANT)

👉 You do NOT need Visual Studio.

Instead install ONE of:

- Zig (recommended)
- OR MSYS2 (GCC)

Used ONLY for Tree-sitter parser compilation.

---

# ⚡ First Launch

On first open:

1. Plugins install automatically (Lazy.nvim)
2. LSP servers install via Mason
3. Treesitter parsers build automatically
4. Restart Neovim once after setup

---

# 📦 Installing AstroCommunity Plugins

AstroCommunity is a curated plugin marketplace for AstroNvim.

It allows you to install:

- LSP packs
- language setups
- UI plugins
- AI integrations

---

## 🧠 How it works

You don’t install plugins manually.

Instead you import them in:

```text
lua/community.lua
```

---

## ✏️ Example Setup

```lua
return {
  "AstroNvim/astrocommunity",

  -- AI tools
  { import = "astrocommunity.completion.copilot-lua" },

  -- Language support packs
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.python" },

  -- UI themes
  { import = "astrocommunity.colorscheme.catppuccin" },
}
```

---

## 🔄 After adding plugins

Run:

```vim
:Lazy sync
```

Then restart Neovim.

---

# 🧠 Plugin Management Model

AstroNvim uses 3 layers:

| Layer          | Purpose              |
| -------------- | -------------------- |
| Mason          | installs LSP tools   |
| Lazy.nvim      | installs plugins     |
| AstroCommunity | curated plugin packs |

---

# ⚡ Key Workflow (IMPORTANT)

## 💡 Coding flow

1. Write code normally (ignore imports)
2. Completion suggests LSP + AI
3. Press:

```
<leader>A
```

👉 Fixes:

- missing imports
- lint issues
- formatting (optional)

---

## ⚡ Completion priority

```
LSP → AI (Copilot) → Snippets
```

---

# 🔧 Key Bindings

## LSP

| Key          | Action                        |
| ------------ | ----------------------------- |
| `<leader>la` | Code actions (imports, fixes) |
| `<leader>A`  | Fix all + add imports         |
| `<leader>lf` | Format file                   |

---

## Navigation

| Key          | Action         |
| ------------ | -------------- |
| `<leader>ff` | Find files     |
| `<leader>fw` | Search project |
| `<leader>fb` | Buffers        |

---

## Treesitter (Structural Editing)

| Key       | Action             |
| --------- | ------------------ |
| `vaf`     | Select function    |
| `vif`     | Inner function     |
| `daf`     | Delete function    |
| `]f / [f` | Navigate functions |

---

# 🧠 Architecture Overview

```
AstroNvim
 ├── Lazy.nvim (plugins)
 ├── Mason (LSP installation)
 ├── AstroCommunity (plugin packs)
 ├── Blink (completion engine)
 ├── Copilot (AI)
 ├── Treesitter (structure engine)
```

---

# 🛠 Troubleshooting

## ❌ No auto-import suggestions

- Ensure `vtsls` installed:

```
:Mason
```

---

## ❌ Treesitter errors

```
:TSInstall javascript tsx
```

If compilation fails → install Zig

---

## ❌ LSP not working

```
:LspInfo
```

---

# 🔄 Updating Setup

```bash
git pull
```

Then inside Neovim:

```vim
:Lazy sync
:AstroUpdate
```

---

# 🎯 Philosophy

This setup prioritizes:

- Minimal manual configuration
- Fast feedback loop
- VS Code-like UX with Neovim speed
- AI + LSP synergy instead of duplication

---

# 🚀 Future Improvements

Planned enhancements:

- auto-import on save
- improved AI ranking in completion
- deeper React workflow integration
- zero-config new machine bootstrap

---
