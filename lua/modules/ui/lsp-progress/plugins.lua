local module = {}

-- module.package = {
--     'windwp/windline.nvim',
--     config = function()
--         require('wlsample.bubble')
--     end
-- }

module.package = {
  'j-hui/fidget.nvim',
  config = function()
    vim.notify('loaded')
    require "fidget".setup {}
  end,
  -- after = "nvim-lspconfig",
  opt = true,
}

return module
