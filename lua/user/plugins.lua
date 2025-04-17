local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
  use { "wbthomason/packer.nvim", commit = "6afb67460283f0e990d35d229fd38fdc04063e0a" } -- Have packer manage itself
  use { "nvim-lua/plenary.nvim", commit = "4b7e52044bbb84242158d977a50c4cbcd85070c7" } -- Useful lua functions used by lots of plugins
  use { "windwp/nvim-autopairs", commit = "4fc96c8f3df89b6d23e5092d31c866c53a346347" } -- Autopairs, integrates with both cmp and treesitter

  use { "numToStr/Comment.nvim", commit = "97a188a98b5a3a6f9b1b850799ac078faa17ab67" }
  -- use { "JoosepAlviste/nvim-ts-context-commentstring", commit = "4d3a68c41a53add8804f471fcc49bb398fe8de08" }
  use { "kyazdani42/nvim-web-devicons", commit = "563f3635c2d8a7be7933b9e547f7c178ba0d4352" }
  -- Folders, git icons, also defines keymaps on TS
  use { "nvim-tree/nvim-tree.lua", tag="v1.11.0" }
  -- use { "kyazdani42/nvim-tree.lua", tag = "v1.6" }
  -- Visualize buffers, optionally LSP integration
  use { "akinsho/bufferline.nvim", tag = "v4.6.1" }
  -- Enabled Bdelete and Bwipeout
	use { "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" }
  -- Modifies the neovim statusline
  use { "nvim-lualine/lualine.nvim", commit = "a52f078026b27694d2290e34efa61a6e4a690621" }
  use { "akinsho/toggleterm.nvim", commit = "2a787c426ef00cb3488c11b14f5dcf892bbd0bda" }
 --  use { "ahmedkhalf/project.nvim", commit = "628de7e433dd503e782831fe150bb750e56e55d6" }
 -- Speedup loading Lua modules and files.
  use { "lewis6991/impatient.nvim", commit = "b842e16ecc1a700f62adb9802f8355b99b52a5a6" }
  -- Indentation highlights
  use { "lukas-reineke/indent-blankline.nvim", commit = "db7cbcb40cc00fc5d6074d7569fb37197705e7f6" }
  use { "goolord/alpha-nvim", commit = "0bb6fc0646bcd1cdb4639737a1cee8d6e08bcc31" }
	use { "folke/which-key.nvim" }

	-- Telescope
  use { "nvim-telescope/telescope.nvim", tag = "0.1.8" }

	-- Treesitter
	use {
		"nvim-treesitter/nvim-treesitter",
		tag = "v0.9.3",
	}

  -- Surround selected cursor with quotes/parentheses/brackets/etc.
  use { "tpope/vim-surround", commit = "3d188ed2113431cf8dac77be61b842acb64433d9"}
  use {
    'andymass/vim-matchup',
    setup = function()
      -- may set any options here
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
      vim.g.matchup_matchparen_enabled = 1
      vim.g.matchup_matchparen_deferred = 1
      vim.g.matchup_matchparen_hi_surround_always = 1
      vim.g.matchup_matchparen_timeout = 200
      vim.g.matchup_delim_noskips = 'string'
    end
  }

	-- Git
	use { "lewis6991/gitsigns.nvim", tag = "v0.9.0" }
  use { "sindrets/diffview.nvim" }

	-- Colorschemes
  use { "folke/tokyonight.nvim", commit = "66bfc2e8f754869c7b651f3f47a2ee56ae557764" }
  use { "lunarvim/darkplus.nvim", commit = "13ef9daad28d3cf6c5e793acfc16ddbf456e1c83" }
  use { "rebelot/kanagawa.nvim" }
  use { "olivercederborg/poimandres.nvim" }
  use { "sainnhe/gruvbox-material" }
  use { "catppuccin/nvim", as = "catppuccin" }


	-- Cmp (completion engine)
  use { "hrsh7th/nvim-cmp"} -- The completion plugin
  use { "hrsh7th/cmp-buffer"} -- buffer completions
  use { "hrsh7th/cmp-path"} -- path completions
  use { "hrsh7th/cmp-cmdline"}
	use { "hrsh7th/cmp-nvim-lsp"}
	use { "hrsh7th/cmp-nvim-lua"}
  use { "saadparwaiz1/cmp_luasnip"} -- snippet completions

	-- Snippets
  use { "L3MON4D3/LuaSnip", commit = "8f8d493e7836f2697df878ef9c128337cbf2bb84" } --snippet engine
  use { "rafamadriz/friendly-snippets", commit = "2be79d8a9b03d4175ba6b3d14b082680de1b31b1" } -- a bunch of snippets to use

	-- LSP
	-- use { "neovim/nvim-lspconfig", commit = "f11fdff7e8b5b415e5ef1837bdcdd37ea6764dda" } -- enable LSP
	use { "neovim/nvim-lspconfig", tag = "v1.2.0" } -- enable LSP
  use { "williamboman/mason.nvim", commit = "c2002d7a6b5a72ba02388548cfaf420b864fbc12"} -- simple to use language server installer
  use { "williamboman/mason-lspconfig.nvim", commit = "0051870dd728f4988110a1b2d47f4a4510213e31" }
	-- use { "nvimtools/none-ls.nvim", commit = "709a5e56f4273deca737d43355212ac94c1b5083" } -- for formatters and linters

  -- Automatically highlighting other uses of word under cursor
  use { "RRethy/vim-illuminate", commit = "a2e8476af3f3e993bb0d6477438aad3096512e42" }
  -- use {'neoclide/coc.nvim', commit = '3dc6153a85ed0f185abec1deb972a66af3fbbfb4', run = 'npm ci'}

  use { 'rcarriga/nvim-notify', tag = "v3.13.4"}
 --  -- Rust
 --  use 'simrat39/rust-tools.nvim'

 --  -- Python
 --  use { "https://github.com/nvie/vim-flake8" }
 --  use {"ChristianChiarulli/swenv.nvim"}
 --  use {"stevearc/dressing.nvim"}
  use { "mfussenegger/nvim-dap-python", requires = { "mfussenegger/nvim-dap" } }
  use { "nvim-neotest/neotest", requires = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } }
  use { "nvim-neotest/neotest-python" }

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
