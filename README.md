Max Lukonin's nvim configuration, based on ThePrimeagen's tutorials
Feel free to use, fork and share this

## Setup Instructions

1. Install [packer](https://github.com/wbthomason/packer.nvim)
2. Make sure `nodejs` is installed (`nodejs` and `npm` packages)
3. Ensure you have Neovim 0.11.0+ (`nvim --version`)
4. Clone repository into `~/.config/`
5. `cd ~/.config/nvim`
6. `nvim .`
7. Navigate to `lua/mxluk/packer.lua`
8. `:so` and `:PackerSync` (this will install plugins and treesitter parsers)
9. Restart nvim (`:q` and reopen)
10. `:MasonInstall typescript-language-server` (or other LSP servers you need)
11. `:Copilot setup`

## Treesitter

The config uses the new nvim-treesitter API (post-rewrite). Core parsers (JS, TS, Lua, Vim, C) are installed automatically via PackerSync.

To add more languages: `:TSInstall <language>`
To check installed parsers: `:TSInstallInfo`
