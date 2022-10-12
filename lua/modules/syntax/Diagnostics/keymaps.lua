local keymaps = {
  buffer = 'lsp',
  {
    "<LEADER>o",
    name = '+Open',
    { 'T', '<CMD>TroubleToggle<CR>', name = 'toggle Trouble' },
  },
  {
    "<LEADER>c",
    name = '+Code',
    { 'q', '<CMD>TroubleToggle<CR>', name = 'toggle Trouble' },
  },
}
return keymaps
