local module = {}

module.package = {
  "RRethy/vim-illuminate",
  config = function()
    require('illuminate').configure {
      filetypes_denylist = {
        'alpha',
        'toggleterm',
        'packer',
        'help',
        'TelescopePrompt',
        'Trouble',
      },
    }
    vim.api.nvim_create_autocmd({'VimEnter', 'ColorScheme'}, {
      group = vim.api.nvim_create_augroup('illuminate_group', { clear = true }),
      callback = function()
        local set_hl = vim.api.nvim_set_hl
        set_hl(0, 'IlluminatedWordText', { bg = vim.fn.synIDattr(vim.fn.hlID('GruvboxBg2'), 'fg') })
        set_hl(0, 'IlluminatedWordRead', { bg = vim.fn.synIDattr(vim.fn.hlID('GruvboxBg2'), 'fg') })
        set_hl(0, 'IlluminatedWordWrite', { bg = vim.fn.synIDattr(vim.fn.hlID('GruvbovBg2'), 'fg') })
      end
    })
  end,
  event = 'BufReadPost',
}

return module
