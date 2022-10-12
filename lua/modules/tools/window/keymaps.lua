local keymaps = {
  {
    '<LEADER>w',
    { 'f', '<CMD>FocusMaxOrEqual<CR>',
      name = 'Toggles Between having the splits equalised or the focussed window maximised' },
    { 'n', '<CMD>FocusSplitNicely<CR>',
      name = 'Toggles Between having the splits equalised or the focussed window maximised' },
    { 'c', '<CMD>FocusSplitCycle<CR>',
      name = 'Toggles Between having the splits equalised or the focussed window maximised' },
  },
  {
    '<LEADER>tf',
    name = '+Focus',
    { 'f', '<CMD>FocusToggleWindow<CR>', name = 'Toggle focus on and off again' },
    { 'p', '<CMD>FocusToggleWindow<CR>', name = 'Toggle focus on and off again on a per window basis' },
  },
}
return keymaps
