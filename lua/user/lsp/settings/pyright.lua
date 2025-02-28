return {
  settings = {
    -- use ruff instead
    python = {
      analysis = {
        typeCheckingMode = "false",
        ignore = { "*" }
      },
    },
    pyright = {
      disableOrganizeImorts = true
    },
  },
}
