local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local colors = {
  bg       = '#202328',
  fg       = '#bbc2cf',
  white    = '#ffffff',
  yellow   = '#ECBE7B',
  cyan     = '#008080',
  darkblue = '#081633',
  green    = '#98be65',
  orange   = '#FF8800',
  violet   = '#a9a1e1',
  magenta  = '#c678dd',
  blue     = '#51afef',
  red      = '#ec5f67',
  gray     = '#aeb6bf',
}

local diagnostics = {
	"diagnostics",
	-- sources = { "nvim_diagnostic" },
	sources = { "nvim_lsp" },
	-- sections = { "error", "warn" },

  symbols = { error = ' ', warn = ' ', info = ' ' },
  diagnostics_color = {
    color_error = { fg = colors.red },
    color_warn = { fg = colors.yellow },
    color_info = { fg = colors.cyan },
  },
	-- colored = false,
	update_in_insert = false,
	always_visible = false,
}

local diff = {
	"diff",
  symbols = { added = ' ', modified = '󰝤 ', removed = ' ' },
  diff_color = {
    added = { fg = colors.green },
    modified = { fg = colors.orange },
    removed = { fg = colors.red },
  },
  cond = hide_in_width
}

local mode = {
	"mode",
	fmt = function(str)
		return "   " .. str .. "  "
	end,
  color = function()
    -- auto change color according to neovims mode
    local mode_color = {
      n = colors.white,
      i = colors.green,
      v = colors.blue,
      [''] = colors.blue,
      V = colors.blue,
      c = colors.magenta,
      no = colors.red,
      s = colors.orange,
      S = colors.orange,
      [''] = colors.orange,
      ic = colors.yellow,
      R = colors.violet,
      Rv = colors.violet,
      cv = colors.red,
      ce = colors.red,
      r = colors.cyan,
      rm = colors.cyan,
      ['r?'] = colors.cyan,
      ['!'] = colors.red,
      t = colors.red,
    }
    return { fg = mode_color[vim.fn.mode()], gui='bold' }
  end,
  padding = { right = 1 },
}

local filetype = {
	"filetype",
	-- icons_enabled = false,
	-- icon = nil,
  icon = ' LSP:',
  color = { fg = colors.white, gui = 'bold' },
}

local branch = {
	"branch",
  icon = "",
  color = { bg = colors.darkblue, fg = "#aaaaaa", gui = 'bold' },
}

local location = {
	"location",
	padding = 0,
}

-- cool function for progress
local progress = {
  "progress",
  fmt = function(str)
    local current_line = vim.fn.line(".")
    local total_lines = vim.fn.line("$")
    local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
    local line_ratio = current_line / total_lines
    local index = math.ceil(line_ratio * #chars)
    return string.format('%.00f', line_ratio * 100) .. "%%"
  end,
  color= {
    fg=colors.darkblue,
    bg=colors.orange,
    gui = 'bold'
  },
}

local spaces = function()
	return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

local fileformat = {
  "fileformat",
  symbols = {
    unix = '', -- e712
    dos = '',  -- e70f
    mac = '',  -- e711
  }
}

local function CurrentFunctionName()
  local ts_utils = require'nvim-treesitter.ts_utils'
  local node_at_cursor = ts_utils.get_node_at_cursor()
  while node_at_cursor do
    if node_at_cursor:type() == 'function_definition' or node_at_cursor:type() == 'class_definition' then
      local name_node = node_at_cursor:field('name')[1]
      if name_node then
        return vim.treesitter.get_node_text(name_node, 0)
      end
    end
    node_at_cursor = node_at_cursor:parent()
  end
  return ''
end

local CurrentFunction = {
  CurrentFunctionName, color={ fg=colors.white }
}

-- local function Path()
--   -- Get the current file path
--   local current_file = vim.fn.expand('%:p')
--
--   -- Get the root of the current working directory or project
--   local project_root = vim.fn.expand('%:p:h')
--
--   -- Traverse up to the root using the pattern for `.git` directory or other project marker
--   local git_root = vim.fn.finddir(".git/..", project_root .. ";")
--
--   -- If a root directory was found, compute relative path
--   if git_root and git_root ~= "" then
--     return vim.fn.fnamemodify(current_file, ':~:.')
--   else
--     -- If no project root is found, just return the relative path from the current working directory
--     return vim.fn.expand('%')
--   end
-- end

-- local windows = {
--   'windows',
--   show_filename_only = false,   -- Shows shortened relative path when set to false.
--   show_modified_status = true, -- Shows indicator when the window is modified.
--
--   mode = 0, -- 0: Shows window name
--             -- 1: Shows window index
--             -- 2: Shows window name + window index
--
--   max_length = vim.o.columns * 9 / 10, -- Maximum width of windows component,
--                                       -- it can also be a function that returns
--                                       -- the value of `max_length` dynamically.
--   color= {
--     fg=colors.orange,
--     bg=colors.orange,
--     -- gui = 'bold'
--   },
--
-- }

local filename = {
  'filename',
  path = 1,
  shorting_target = 40,    -- Shortens path to leave 40 spaces in the window
                           -- for other components. (terrible name, any suggestions?)
  symbols = {
    modified = '[+]',      -- Text to show when the file is modified.
    readonly = '[-]',      -- Text to show when the file is non-modifiable or readonly.
    unnamed = '[No Name]', -- Text to show for unnamed buffers.
    newfile = '[New]',     -- Text to show for newly created file before first write
  },
  color= {
    fg=colors.gray,
  },
}

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "onedark",
    globalstatus = true,
		-- component_separators = { left = "", right = "" },
		-- section_separators = { left = "", right = "" },
    -- section_separators = { left = '', right = '' },
    -- component_separators = { left = '', right = '' },
		disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
		-- always_divide_middle = true,
	},
	sections = {
		lualine_a = { branch },
		lualine_b = { mode },
		lualine_c = { filename, CurrentFunction },
		lualine_x = { diagnostics, diff, filetype },
		lualine_y = { location },
		lualine_z = { progress },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})
