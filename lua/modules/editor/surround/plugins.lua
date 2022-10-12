local module = {}

module.package = {
  "kylechui/nvim-surround",
  config = function()
    require("nvim-surround").setup {}
  end,
  event = 'BufReadPost',
}

return module
