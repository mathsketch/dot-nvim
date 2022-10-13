local keymaps = {
  '<LEADER>t',
  name = '+Toggle',
  {
    "z",
    name = "+Zen",
    { 'a', '<CMD>TZAtaraxis<CR>', name = "toggle ataraxis mode" },
    { 'm', '<CMD>TZMinimalist<CR>', name = "toggle minimalist mode" },
    { 'n', '<CMD>TZNarrow<CR>', name = "toggle narrow mode" },
    { 'f', '<CMD>TZFocus<CR>', name = "toggle focus mode" },
  },
}
return keymaps
