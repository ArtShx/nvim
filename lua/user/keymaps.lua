local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
-- local keymap = vim.api.nvim_set_keymap
local keymap = vim.keymap.set

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
-- keymap("n", "<C-H>", "<C-w>t", opts)  -- go to leftmost
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
-- keymap("n", "<C-S-l>", "<C-w>b", opts)  -- go to rightmost

-- Normal GUI Editor Shortcuts
-- keymap("n", "<C-w>", ":Bdelete<CR>", opts)
-- keymap("n", "<C-w>", ":Bdelete this<CR>", opts)
keymap("n", "<C-s>", ":w<CR>", opts)
keymap("i", "<C-s>", "<ESC>:w<CR>", opts)

keymap("n", "<Leader>q", ":q<CR>:DiffviewClose<CR>", opts)
keymap("n", "|", ":vsplit<CR>", opts) -- open vertical split
keymap("n", "<C-a>", "gg<S-v>G", opts) -- select all

-- Quickly insert an empty new line without entering insert mode
keymap("n", "<Leader>o", "o<ESC>", opts)
keymap("n", "<Leader>O", "O<ESC>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("i", "<A-j>", "<ESC>:m .+1<CR>==", opts)
keymap("i", "<A-k>", "<ESC>:m .-2<CR>==", opts)
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)

-- Insert --
-- Press jk fast to exit insert mode 
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Open Diffview
keymap("n", "<leader>gv", function ()
  vim.cmd(":DiffviewFileHistory %")
end, opts)

keymap("v", "<leader>gv", function ()
  vim.cmd("'<,'> DiffviewFileHistory")
end, opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)


-- keymap("n", "<Leader>q", ":q<CR>", opts)
--
-- vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {desc = 'Search And Replace The Word Under The Cursor'})
-- keymap("n", "<Leader>u", "[[:%s/\\<<C-r><C-w\\>/<C-r><C-w>/gI<Left><Left><Left>]]", opts)
keymap("n", "<Leader>u", ":%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>", opts)


-- vim.keymap.set("n", "<leader>s", function()
--   local word = vim.fn.expand("<cword>")
--   vim.cmd(":%s/" .. word .. "/" .. word .. "/gI<Left><Left><Left>")
-- end, { desc = 'Search And Replace The Word Under The Cursor' })


-- Marker and Jumper
-- When moving to a jumper with ', always use uppercase letters and redraw cursor at center of window
vim.keymap.set('n', "'", function()
  local mark = vim.fn.getcharstr()
  vim.cmd("normal! '" .. string.upper(mark) .. "zz")
end)

-- When setting a marker, always use uppercase letters
keymap("n", "m", function ()
  local mark = vim.fn.getcharstr()
  vim.cmd("normal! m" .. string.upper(mark))
end)
