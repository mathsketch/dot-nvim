local module = {}

module.package = {
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup {}
  end,
  event = 'BufReadPost',
  opt = true,
}

return module
