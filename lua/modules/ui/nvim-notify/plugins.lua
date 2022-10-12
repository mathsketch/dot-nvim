local module = {}

-- module.package = {
--     'windwp/windline.nvim',
--     config = function()
--         require('wlsample.bubble')
--     end
-- }

module.package = {
  'rcarriga/nvim-notify',
  config = function()
    require('notify').setup({
      background_colour = '#282828',
    })
  end,
  module = 'notify',
}

return module
