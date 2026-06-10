# Agent Guide for this Neovim config

## Repository purpose
Personal Neovim configuration managed with [lazy.nvim](https://github.com/folke/lazy.nvim).

## Entry points
- `init.lua` → loads `config.options`, `config.autocmds`, then `config.lazy`.
- `lua/config/lazy.lua` bootstraps lazy.nvim and loads all specs from `lua/plugins/`.

## Plugin structure
- One plugin spec per file under `lua/plugins/`. Each file returns a lazy.nvim spec table.
- `lazy-lock.json` is committed. Run `:Lazy sync` inside Neovim to update it.
- Do **not** add plugin logic outside `lua/plugins/` or `lua/config/`.

## Key conventions
- **Leader**: `<Space>`.
- **Indentation**: 2 spaces (`shiftwidth=2`, `tabstop=2`).
- **Colorscheme**: `catppuccin-macchiato` (set in `lua/plugins/catppuccin.lua`).
- **File explorer**: `oil.nvim` (bound to `<leader>e`).
- **Fuzzy finder / picker**: `snacks.nvim` picker (bound to various `<leader>` keys). See `lua/plugins/snacks.lua` for keymaps.

## LSP and tooling
- **LSP servers enabled**: `lua_ls`, `ts_ls`, `oxlint`, `jsonls`, `ocamllsp`, `tailwindcss`.
- **LSP setup**: Uses `vim.lsp.enable()` (requires Neovim 0.11+). Mason ensures servers are installed.
- **Formatters**: `oxfmt` for JS/TS/JSON/Vue, `ocamlformat` for OCaml. Conform runs on save.
- **Completion**: `blink.cmp` with `enter` preset.

## Custom treesitter parsers
- `treesitter-parsers.json` pins a curated set of parsers and their query sources. This is used by the `ts-enable.nvim` plugin. Do not treat it as a standard lockfile.

## Operational notes
- No tests, build scripts, or CI. Validation is manual: open Neovim and run `:checkhealth`, `:Lazy`, and `:Mason`.
- Changing a plugin spec usually takes effect immediately via lazy.nvim’s reload; major changes may require restarting Neovim.
- Keep plugin specs minimal. Prefer `opts = { ... }` over full `config = function()` when the plugin supports it.
