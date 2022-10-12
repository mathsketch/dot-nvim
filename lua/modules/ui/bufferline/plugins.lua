local module = {}

module.package = {
  'romgrk/barbar.nvim',
  config = function()
    require('bufferline').setup {
      auto_hide = true,
      exclude_ft = {
        'alpha',
        'man',
        'help',
        'qf',
        '',
      },
      exclude_name = {
        'Legendary Scratchpad',
      },
      icon_pinned = '車',
      icon_separator_inactive = '▎',
      icon_separator_active = '▎',
      icon_close_tab_modified = '●',
      icon_close_tab = '',
    }
    vim.api.nvim_set_hl(0, 'BufferCurrent', { bold = true })
    local set_barline_hl = function()
      local get_hlfg = function(group)
        return vim.fn.synIDattr(vim.fn.hlID(group), 'fg')
      end
      local set_hl = vim.api.nvim_set_hl
      set_hl(0, 'BufferVisible', { fg = get_hlfg('GruvboxBlue') })
      set_hl(0, 'BufferVisibleSign', { fg = get_hlfg('GruvboxBlue') })
      set_hl(0, 'BufferCurrentMod', { fg = get_hlfg('GruvboxGreen'), bold = true })
      set_hl(0, 'BufferVisibleMod', { fg = get_hlfg('GruvboxGreen') })
      set_hl(0, 'BufferInactiveMod', { fg = get_hlfg('GruvboxGreen') })
      set_hl(0, 'BufferCurrent', { fg = get_hlfg('GruvboxFg1'), bold = true })
    end
    set_barline_hl()
    vim.api.nvim_create_autocmd('ColorScheme', {
      callback = set_barline_hl,
    })
  end,
  event = 'BufAdd',
}

return module
