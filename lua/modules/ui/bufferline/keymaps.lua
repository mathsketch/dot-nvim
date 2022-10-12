local keymaps = {
  {
    '<LEADER>b',
    name = '+Buffer',
    {'p', '<CMD>BufferPrevious<CR>', name = 'jump to previous buffer'},
    {'n', '<CMD>BufferNext<CR>', name = 'jump to next buffer'},
    {'[', '<CMD>BufferPrevious<CR>', name = 'jump to previous buffer'},
    {']', '<CMD>BufferNext<CR>', name = 'jump to next buffer'},
    {'N', '<CMD>BufferMoveNext<CR>', name = 'move buffer to next'},
    {'P', '<CMD>BufferMovePrevious<CR>', name = 'move buffer to previous'},
    {'l', '<CMD>BufferPin<CR>', name = 'pin buffer'},
    {'g', '<CMD>BufferPick<CR>', name = 'buffer picking mode'},
    {'D', '<CMD>BufferCloseAllButCurrentOrPinned<CR>', name = 'close all buffers except pinned or current buffers'},
    {'`', '<C-^>', name = 'jump to last buffer'},
  },
  {'<A-`>', '<C-^>', name = 'jump to last buffer'},
  {'<LEADER>`', '<C-^>', name = 'jump to last buffer'},
}

for i=1,9,1 do
  table.insert(keymaps, {string.format('<A-%s>', i), string.format('<CMD>BufferGoto %s<CR>', i), name = 'goto buffer' .. i})
end

return keymaps
