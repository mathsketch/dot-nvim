local keymaps = {
  '<LEADER>t',
  name = '+Toggle',
  {
    { 't', '<CMD>TaboutToggle<CR>', name = "toggle Tabout" },
  },
}
return keymaps
