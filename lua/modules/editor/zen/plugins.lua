local module = {}

module.package = {
  "Pocco81/true-zen.nvim",
  config = function()
    require("true-zen").setup {
    }
  end,
  cmd = { "TZAtaraxis", "TZMinimalist", "TZNarrow", "TZFocus" },
}

return module
