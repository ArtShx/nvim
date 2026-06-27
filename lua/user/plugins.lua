return {
  -- Plenary (utility library used by many plugins)
  { "nvim-lua/plenary.nvim", commit = "4b7e52044bbb84242158d977a50c4cbcd85070c7" },

  -- Autopairs
  { "windwp/nvim-autopairs", commit = "4fc96c8f3df89b6d23e5092d31c866c53a346347" },

  -- Comment
  { "numToStr/Comment.nvim", commit = "97a188a98b5a3a6f9b1b850799ac078faa17ab67" },

  -- Icons
  { "kyazdani42/nvim-web-devicons", commit = "563f3635c2d8a7be7933b9e547f7c178ba0d4352" },

  -- File explorer
  { "nvim-tree/nvim-tree.lua", tag = "v1.11.0" },

  -- Buffer tab line
  { "akinsho/bufferline.nvim", tag = "v4.6.1" },

  -- Buffer delete commands (Bdelete, Bwipeout)
  { "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" },

  -- Statusline
  { "nvim-lualine/lualine.nvim", commit = "a52f078026b27694d2290e34efa61a6e4a690621" },

  -- Terminal integration
  { "akinsho/toggleterm.nvim", commit = "2a787c426ef00cb3488c11b14f5dcf892bbd0bda" },

  -- Indent guides
  { "lukas-reineke/indent-blankline.nvim", commit = "db7cbcb40cc00fc5d6074d7569fb37197705e7f6" },

  -- Startup dashboard
  { "goolord/alpha-nvim", commit = "0bb6fc0646bcd1cdb4639737a1cee8d6e08bcc31" },

  -- Keybinding popup
  { "folke/which-key.nvim" },

  -- Fuzzy finder
  { "nvim-telescope/telescope.nvim", tag = "0.1.8" },

  -- Syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    tag = "v0.9.3",
    build = ":TSUpdate",
  },

  -- Surround text objects
  { "tpope/vim-surround", commit = "3d188ed2113431cf8dac77be61b842acb64433d9" },

  -- Enhanced % matching
  {
    "andymass/vim-matchup",
    init = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
      vim.g.matchup_matchparen_enabled = 1
      vim.g.matchup_matchparen_deferred = 1
      vim.g.matchup_matchparen_hi_surround_always = 1
      vim.g.matchup_matchparen_timeout = 200
      vim.g.matchup_delim_noskips = "string"
    end,
  },

  -- Git signs
  { "lewis6991/gitsigns.nvim", tag = "v0.9.0" },

  -- Git diff viewer
  { "sindrets/diffview.nvim" },

  -- Colorschemes
  { "folke/tokyonight.nvim", commit = "66bfc2e8f754869c7b651f3f47a2ee56ae557764" },
  { "lunarvim/darkplus.nvim", commit = "13ef9daad28d3cf6c5e793acfc16ddbf456e1c83" },
  { "rebelot/kanagawa.nvim" },
  { "olivercederborg/poimandres.nvim" },
  { "sainnhe/gruvbox-material" },
  { "catppuccin/nvim", name = "catppuccin" },

  -- Completion engine
  { "hrsh7th/nvim-cmp", commit = "d97d85e" },
  { "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" },
  { "hrsh7th/cmp-path", commit = "91ff86cd9c29299a64f968ebb45846c485725f23" },
  { "hrsh7th/cmp-cmdline", commit = "d250c63aa13ead745e3a40f61fdd3470efde3923" },
  { "hrsh7th/cmp-nvim-lsp", commit = "39e2eda76828d88b773cc27a3f61d2ad782c922d" },
  { "hrsh7th/cmp-nvim-lua", commit = "f12408bdb54c39c23e67cab726264c10db33ada8" },
  { "saadparwaiz1/cmp_luasnip" },

  -- Snippets
  { "L3MON4D3/LuaSnip", commit = "3732756842a2f7e0e76a7b0487e9692072857277" },
  { "rafamadriz/friendly-snippets", commit = "2be79d8a9b03d4175ba6b3d14b082680de1b31b1" },

  -- LSP
  { "neovim/nvim-lspconfig", tag = "v1.2.0" },
  { "williamboman/mason.nvim", commit = "c2002d7a6b5a72ba02388548cfaf420b864fbc12" },
  { "williamboman/mason-lspconfig.nvim", commit = "0051870dd728f4988110a1b2d47f4a4510213e31" },

  -- Word-under-cursor highlighting
  { "RRethy/vim-illuminate", commit = "a2e8476af3f3e993bb0d6477438aad3096512e42" },

  -- Notification UI
  { "rcarriga/nvim-notify", tag = "v3.13.4" },

  -- Debug & Test
  { "mfussenegger/nvim-dap-python", dependencies = { "mfussenegger/nvim-dap" } },
  {
    "nvim-neotest/neotest",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
  },
  { "nvim-neotest/neotest-python" },

  -- Amazon Q AI assistant
  { "awslabs/amazonq.nvim" },
}
