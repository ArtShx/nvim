return {
  settings = {
    gopls = {
      usePlaceholders = true, -- This makes Go snippets (like functions) much better
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
}
