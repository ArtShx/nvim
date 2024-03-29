-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- Keymaps -- 
-- Normal --
-- -- Normal GUI Editor Shortcuts
lvim.keys.normal_mode["<C-w>"] = ":Bdelete this<CR>"
lvim.keys.normal_mode["<C-s>"] = ":w<CR>"
lvim.keys.insert_mode["<C-s>"] = "<ESC>:w<CR>"
-- lvim.keys.normal_mode["<Tab>"] = "<C-W>w"  -- Swtich windows easily
lvim.keys.normal_mode["|"] = ":vsplit<CR>"  -- Open vertical split
-- lvim.keys.normal_mode["<cr>"] = "ciw"
lvim.keys.normal_mode["<C-a>"] = "gg<S-v>G"

-- -- Quickly insert an empty new line without entering insert mode
lvim.keys.normal_mode["<Leader>o"] = "o<ESC>"
lvim.keys.normal_mode["<Leader>O"] = "O<ESC>"

-- Navigate buffers
lvim.keys.normal_mode["<S-l>"] = ":bnext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":bprevious<CR>"

-- Insert --
-- Press jk fast to exit insert mode 
lvim.keys.insert_mode["jk"] = "<ESC>"
lvim.keys.insert_mode["kj"] = "<ESC>"

lvim.keys.visual_mode["p"] = '"_dP'

-- Telescope mapping mods
local telescope_actions = require("lvim.utils.modules").require_on_exported_call "telescope.actions"
lvim.builtin.telescope.defaults.mappings.n["<C-j>"] = telescope_actions.move_selection_next
lvim.builtin.telescope.defaults.mappings.n["<C-k>"] = telescope_actions.move_selection_previous
lvim.builtin.telescope.defaults.mappings.i["<C-j>"] = telescope_actions.move_selection_next
lvim.builtin.telescope.defaults.mappings.i["<C-k>"] = telescope_actions.move_selection_previous

-- Maybe should install plugin on the 1st time
-- TODO: CHANGED RED color into WHITE on the plugins folder directly
-- tried to change in here but failed
-- check /home/arthur/.local/share/lunarvim/site/pack/lazy/opt/onedark.vim/autoload/onedark.vim
lvim.colorscheme = "onedark"


-- install plugins
lvim.plugins = {
  "Asheq/close-buffers.vim",
  "tpope/vim-surround",
  "joshdick/onedark.vim",

  -- PYTHON LSP
  "ChristianChiarulli/swenv.nvim",
  "stevearc/dressing.nvim",
  "mfussenegger/nvim-dap-python",
  "nvim-neotest/neotest",
  "nvim-neotest/neotest-python",
}

-- automatically install python syntax highlighting
lvim.builtin.treesitter.ensure_installed = {
  "python",
}

-- setup formatting
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup { { name = "black" }, }
lvim.format_on_save.enabled = false
lvim.format_on_save.pattern = { "*.py" }

-- setup linting
local linters = require "lvim.lsp.null-ls.linters"
linters.setup { { command = "flake8", filetypes = { "python" } } }

-- Flake8 keymap
lvim.keys.normal_mode["<F7>"] = ":lua RunFlake8()<CR>"

function RunFlake8()
  local current_buffer = vim.api.nvim_get_current_buf()

  -- Save the current buffer
  vim.api.nvim_command('silent! update')

  -- Open a new split window at the bottom
  vim.api.nvim_command('belowright split')

  -- Set the buffer to the current Python file
  vim.api.nvim_command('buffer ' .. current_buffer)

  -- Run Flake8 and display the results in the new split window
  vim.api.nvim_command('silent! term flake8 %')

  -- Go back to the Python file buffer
  vim.api.nvim_command('wincmd p')
end
-- setup debug adapter
lvim.builtin.dap.active = true
local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")
pcall(function()
  require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python")
end)

-- setup testing
require("neotest").setup({
  adapters = {
    require("neotest-python")({
      -- Extra arguments for nvim-dap configuration
      -- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
      dap = {
        justMyCode = false,
        console = "integratedTerminal",
      },
      -- args = { "--log-level", "DEBUG", "--quiet" },
      runner = "pytest",
    })
  }
})

lvim.builtin.which_key.mappings["dm"] = { "<cmd>lua require('neotest').run.run()<cr>",
  "Test Method" }
lvim.builtin.which_key.mappings["dM"] = { "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>",
  "Test Method DAP" }
lvim.builtin.which_key.mappings["df"] = {
  "<cmd>lua require('neotest').run.run({vim.fn.expand('%')})<cr>", "Test Class" }
lvim.builtin.which_key.mappings["dF"] = {
  "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>", "Test Class DAP" }
lvim.builtin.which_key.mappings["dS"] = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Test Summary" }


-- binding for switching
lvim.builtin.which_key.mappings["C"] = {
  name = "Python",
  c = { "<cmd>lua require('swenv.api').pick_venv()<cr>", "Choose Env" },
}vim.use_icons = true

