
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
  }
})
