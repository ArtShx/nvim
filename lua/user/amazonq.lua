require('amazonq').setup({
  ssoStartUrl = 'https://view.awsapps.com/start', -- For Free Tier with AWS Builder ID
  -- OR
  -- ssoStartUrl = 'your-organization-sso-url', -- For Pro subscription
  cmd = { 'node', 'C:/Users/ArtSh/AppData/Local/nvim-data/site/pack/packer/start/amazonq.nvim/language-server/build/aws-lsp-codewhisperer-token-binary.js', '--stdio' },

  -- Enable/disable inline code suggestions
  inline_suggest = true,

  debug = false,
})
