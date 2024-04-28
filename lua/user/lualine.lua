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
}

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	-- sections = { "error", "warn" },

  symbols = { error = ' ', warn = ' ', info = ' ' },
  diagnostics_color = {
    color_error = { fg = colors.red },
    color_warn = { fg = colors.yellow },
    color_info = { fg = colors.cyan },
  },
	-- colored = false,
	update_in_insert = false,
	-- always_visible = true,
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

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "onedark",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
		always_divide_middle = true,
	},
	sections = {
		-- lualine_a = { branch, diagnostics },
		lualine_a = { branch },
		lualine_b = { mode },
		lualine_c = {diagnostics},
		lualine_x = { diff, spaces, "encoding", filetype },
		lualine_y = { location },
		lualine_z = { progress },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})
