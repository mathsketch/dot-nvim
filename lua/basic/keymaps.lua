local km = {}
local modules_dir = vim.fn.stdpath('config') .. '/lua/modules'

local default_settings = {
  prefix = '',
  mode = { 'n' },
  buffer = false,
  display = true,
  opts = {},
}
km.keymaps_legendary = {}
-- km.keymaps_mapper = {}
km.keymap_groups = {}
km.buffer_keymaps = {}

-- keymaps table's sample
-- {
--      '<prefix>',
--      name = name,
--      { 'rhs', 'lhs', 'mode' or { 'modes' }, or mode = , 'name' or name = 'name', {} or opts = {}, display = false},
-- }

vim.g.mapleader = " "
local custom_keymaps = {
  { '<LEADER>fs', '<CMD>w<CR>', name = 'save buffer' },
  {
    '<LEADER>w',
    name = '+Window',
    { 'q', '<C-w>q', name = 'close a window' },
    { 'w', '<C-w>w', name = 'switch windows' },
    { 'h', '<C-w>h', name = 'go to the left window' },
    { 'j', '<C-w>j', name = 'go to the down window' },
    { 'k', '<C-w>k', name = 'go to the up window' },
    { 'l', '<C-w>l', name = 'go to the right window' },
    { 'o', '<C-w>o', name = 'close all other windows' },
    { 'H', '<C-w>H', name = 'move the current window to be at the far left' },
    { 'J', '<C-w>J', name = 'move the current window to be at the very bottom' },
    { 'K', '<C-w>K', name = 'move the current window to be at the very top' },
    { 'L', '<C-w>L', name = 'move the current window to be at the far right' },
    { 'x', '<C-w>x', name = 'exchange current window with next one' },
    { 's', '<C-w>s', name = 'split window' },
    { 'v', '<C-w>v', name = 'split window vertically' },
    { '=', '<C-w>=', name = 'equally high and wide' },
    { '_', '<C-w>_', name = 'max out the height' },
    { '|', '<C-w>|', name = 'max out the width' },
  },
  {
    '<LEADER>b',
    name = '+Buffer',
    { 'd', '<CMD>bdelete<CR>', name = 'close buffer and window' },
  },
  { '<LEADER>qq', '<CMD>qa<CR>', name = 'quit' },
  { 'H', '0', '', display = false },
  { 'L', '$', '', display = false },
  { '<ESC>', '<CMD>noh<CR><ESC>', opts = { silent = true }, display = false },
  { '<C-l>', 'zz', name = 'recenter' },
  { 'J', '', 'v', display = false },
  { '<C-c>', '"+y', 'v', name = 'copy into clipboard' },
  { '<LEADER>hh', '<F1>', name = 'help' },
  { '<LEADER>hr', function()
    local reload = require('plenary.reload').reload_module
    reload('modules')
    reload('basic')
    dofile(vim.env.MYVIMRC)
    require('packer').compile()
    vim.cmd [[doautocmd VimEnter"]]
    vim.cmd [[doautocmd ColorScheme]]
    vim.notify("Refreshing complete")
  end, name = 'refresh init file' },
}

km.transform = function(tbl, settings)
  if type(tbl) ~= 'table' or not next(tbl) then
    return
  end
  local merged_settings = vim.deepcopy(settings or default_settings)

  merged_settings.mode = tbl.mode or merged_settings.mode
  if tbl.buffer ~= nil then
    merged_settings.buffer = tbl.buffer
  end
  if tbl.display ~= nil then
    merged_settings.display = tbl.display or merged_settings.display
  end
  merged_settings.opts = tbl.opts and vim.tbl_extend('force', merged_settings.opts, tbl.opts) or merged_settings.opts

  local first = tbl[1]
  if type(first) == 'table' then
    for _, sub in ipairs(tbl) do
      km.transform(sub, merged_settings)
    end
    return
  end

  merged_settings.prefix = merged_settings.prefix .. first

  local second = tbl[2]
  if type(second) == 'table' then
    if tbl.name then
      km.keymap_groups[merged_settings.prefix] = tbl.name
    end
    for index, sub in ipairs(tbl) do
      if index > 1 then
        km.transform(sub, merged_settings)
      end
    end
    return
  end

  local lhs = merged_settings.prefix
  local rhs = second
  merged_settings.mode = tbl[3] or merged_settings.mode
  local desc = tbl[4] or tbl.name
  merged_settings.opts.desc = desc

  -- if merged_settings.display ~= false then
  --   table.insert(km.keymaps_legendary,
  --     { lhs, mode = merged_settings.mode, description = desc, opts = merged_settings.opts })
  --   -- if type(rhs) == 'string' then
  --   --     table.insert(km.keymaps_mapper, {mode, lhs, rhs, opts, 'Map', name, name})
  --   -- end
  -- end

  if merged_settings.buffer then
    if not km.buffer_keymaps[merged_settings.buffer] then
      km.buffer_keymaps[merged_settings.buffer] = {}
    end
    table.insert(km.buffer_keymaps[merged_settings.buffer], { merged_settings.mode, lhs, rhs, merged_settings.opts })
  else
    vim.keymap.set(merged_settings.mode, lhs, rhs, merged_settings.opts)
  end
end

km.load_buffer_keymaps = function(name, bufnr)
  for _, keymap in ipairs(km.buffer_keymaps[name]) do
    keymap[4].buffer = bufnr
    vim.keymap.set(unpack(keymap))
  end
end

km.load_keymaps = function()
  -- load basic keymaps
  km.transform(custom_keymaps)

  -- load modules keymaps
  local modules_keymap = vim.split(vim.fn.globpath(modules_dir, '*/**/keymaps.lua'), '\n')
  for _, module in ipairs(modules_keymap) do
    local module_keymap = require(string.match(module, '(modules.*/keymaps).lua$'))
    km.transform(module_keymap)
  end
end

return km
