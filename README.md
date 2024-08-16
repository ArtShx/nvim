# Neovim
My *Neovim* setup. Code originally inspired from [Neovim-from-schatch](https://github.com/LunarVim/Neovim-from-scratch) repo.

## Setup
- nvim version: v0.9.0
- python3
- node: v19.8.1
- fd-find
- ripgrep
- lazygit

Clone this repo at `nvim` configuration path (make backup  of your current `nvim` directory if you want to keep it).
` git clone https://github.com/ArtShx/NeovimSetup.git ~/.config/nvim `

Open nvim and enter the following:

` :checkhealth `

## Plugins
- [wbthomason/packer.nvim](https://github.com/wbthomason/packer.nvim): plugin manager;
- [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim): lib used by most plugins;
- [numToStr/Comment.nvim](https://github.com/numToStr/Comment.nvim): smart commenting (native treesitter);
- [kyazdani42/nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua): File explorer;
- [kyazdani42/nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons): add icons;
- [akinsho/bufferline.nvim](https://github.com/akinsho/bufferline.nvim): Managing/prettifying buffer lines;
- [moll/vim-bbye](https://github.com/moll/vim-bbye): Bbye (buffer bye) - enables `:Bdelete` command;
- [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim): Prettifies status line;
- [akinsho/toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim): Persistings/toggling multiples terminals (including Lazygit); 
- [lewis6991/impatient.nvim](https://github.com/lewis6991/impatient.nvim): Speed up loading Lua modules in Neovim to improve startup time;
- [lukas-reineke/indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim): Vertical indentation line
- [goolord/alpha-nvim](https://github.com/goolord/alpha-nvim): Greeter screen;
- [folke/which-key.nvim](https://github.com/folke/which-key.nvim): Create key bindings and a helpful display menu;
- [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim): Fuzzy finder (find, filter, preview, pick);
- [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter): Neovim interface for tree-sitter (parser generator tool, can create a syntax tree for a source file);
- [tpope/vim-surround](https://github.com/tpope/vim-surround): Surrounding `()`, `[]`, `<>`, `""`, and so on;
- [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim): Git signs for added, removed and changed lines;
- [folke/tokyonight.nvim](https://github.com/folke/tokyonight.nvim): Tokyonight colorscheme;
- [lunarvim/darkplus.nvim](https://github.com/lunarvim/darkplus.nvim): Darknight colorscheme;
- [RRethy/vim-illuminate](https://github.com/RRethy/vim-illuminate): highlighting other uses of the word under the cursor using either LSP, Tree-sitter, or regex matching;
- [neoclide/coc.nvim](https://github.com/neoclide/coc.nvim): Nodejs extension host for vim & neovim, load extensions like VSCode and host language servers;
- [rcarriga/nvim-notify](https://github.com/rcarriga/nvim-notify): Fancy, configurable, notification manager;

#### To remove
Replaced by `coc.nvim`:
- [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig): Collection of configurations for the language server clients;
- [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim): Manages LSP servers, DAP, linters, formatters;
- [williamboman/mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim): bridges `mason.nvim` with the `lspconfig` plugin - making it easier to use both plugins together;
- [nvimtools/none-ls.nvim](https://github.com/nvimtools/none-ls.nvim): inject LSP diagnostics, code actions, and more via Lua;


## TODO
[here](./todo.md).
