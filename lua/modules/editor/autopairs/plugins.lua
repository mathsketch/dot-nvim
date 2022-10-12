local module = {}

module.package = {
  "windwp/nvim-autopairs",
  config = function()
    require("nvim-autopairs").setup {
      enable_afterquote = true,
      enable_check_bracket_line = true,
      enable_moveright = true,
    }
  end,
  event = "BufReadPost",
}

return module
