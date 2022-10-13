local module = {}

module.package = {
  "glacambre/firenvim",
  run = function()
    vim.fn['firenvim#install'](0)
  end,
  config = function()
  end,
  opt = true,
}

return module
