
require("neotest").setup({
  adapters = {
    require("neotest-python")({
      dap = {
        justMyCode = false,
        console = "integratedTerminal",
      },
      args = { "-s" },
      runner = "pytest",
      python = "python.exe"
    })
  },
  discovery = {
    filter_dir = function(name, rel_path, root)
        return name ~= "venv_charm"
    end,
  }
})
