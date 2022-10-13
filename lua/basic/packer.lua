local Packer = {}
local modules_dir = '~/.config/nvim/lua/modules'

vim.cmd [[packadd packer.nvim]]
local packer = require("packer")

function Packer.load_plugins()
  local use = packer.use
  packer.init {
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'rounded' })
      end
    }
  }

  packer.reset()

  use { 'wbthomason/packer.nvim' }
  use { 'lewis6991/impatient.nvim' }

  local modules = vim.split(vim.fn.globpath(modules_dir, '*/**/plugins.lua'), '\n')
  for _, module in ipairs(modules) do
    module = require(string.match(module, '(modules.*/plugins).lua$'))
    if type(module.package[1]) == 'string' then
      use(module.package)
    else
      for _, package in ipairs(module.package) do
        use(package)
      end
    end
  end

  local user_plugins = require('basic.plugins')
  if user_plugins.package and type(user_plugins.package[1]) == 'string' then
    use(user_plugins.package)
  else
    for _, package in ipairs(user_plugins) do
      use(package)
    end
  end

end

-- function Packer.do_compile()
--     packer.compile()
-- end

return Packer
