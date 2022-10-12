local module = {}

module.package = {
  'ellisonleao/gruvbox.nvim',
  config = function()
    require("gruvbox").setup {
      undercurl = true,
      underline = true,
      bold = true,
      italic = true,
      strikethrough = true,
      invert_selection = false,
      invert_signs = false,
      invert_tabline = true,
      invert_intend_guides = true,
      inverse = true, -- invert background for search, diffs, statuslines and errors
      contrast = "", -- can be "hard", "soft" or empty string
      overrides = {},
      dim_inactive = false,
      transparent_mode = vim.g.neovide == nil,
    }

    vim.o.background = "dark"
    vim.cmd [[colorscheme gruvbox]]
  end
}

return module
