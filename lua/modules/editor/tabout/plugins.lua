local module = {}

module.package = {
  'abecodes/tabout.nvim',
  after = 'nvim-cmp',
  config = function()
       require('tabout').setup {}
  end,
}

return module
