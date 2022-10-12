vim.o.compatible = false -- 取消 vim 的 vi 兼容模式
vim.o.wildmenu = true
vim.o.termguicolors = true
vim.o.mouse = 'a'
vim.o.title = true
vim.o.wrap = false
vim.o.relativenumber = true
vim.o.number = true
vim.o.cursorline = true
vim.o.hlsearch = true
-- vim.o.clipboard = "unnamedplus"     -- 完全使用系统剪贴板
vim.cmd [[let @/ = ""]]
vim.o.scrolloff = 5
vim.o.showmode = false
vim.o.showcmd = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.autoindent = true
vim.o.autochdir = true
vim.cmd [[syntax on]]
vim.cmd [[filetype on]]
vim.cmd [[filetype indent on]]
vim.cmd [[filetype plugin on]]
vim.cmd [[filetype plugin indent on]]
vim.o.foldmethod = "marker"
vim.o.foldlevel = 99
vim.o.laststatus = 2 -- 永远显示状态栏
vim.o.backspace = "indent,eol,start" -- backspace键无法删除indent，end of line，start

-- Tab space
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- 错误提示音
vim.o.visualbell = false
vim.o.eb = false
-- set vb
-- vim.o.vb = false
-- vim.o.t_vb = ""
-- au GUIEnter * set t_vb=

-- 编码
vim.o.fileencodings = "utf-8,ucs-bom,cp936,big5,gbk"
vim.o.fileencoding = "utf-8"
vim.o.encoding = "utf-8"
vim.o.langmenu = "zh_CN.uft-8"
vim.o.termencoding = "utf-8"
vim.env.LANG = "zh_CN.utf-8"
vim.cmd [[language messages zh_CN.UTF-8]]

vim.o.updatetime = 300
-- let &t_ut=''


-- custom variables
vim.g.floating_style = 'has_border' -- only_bg or has_border
local floating_color_group = vim.api.nvim_create_augroup('floating_color_group', { clear = true })
vim.api.nvim_create_autocmd('ColorScheme', {
  group = floating_color_group,
  callback = function()
    local set_hl = vim.api.nvim_set_hl
    set_hl(0, 'VertSplit', {link = 'GruvboxFg4'})
    if vim.g.floating_style == 'has_border' then
      set_hl(0, 'Pmenu', {link = 'GruvboxFg2'})
    else
      set_hl(0, 'Pmenu', {fg = vim.fn.synIDattr(vim.fn.hlID('GruvboxFg1'), 'fg'), bg = vim.fn.synIDattr(vim.fn.hlID('GruvboxBg2'), 'fg')})
    end
  end,
})

local group = vim.api.nvim_create_augroup('init_neovim', { clear = true,})
-- restore last cursor position
vim.api.nvim_create_autocmd('BufReadPost', {
  group = group,
  pattern = {'*'},
  command = [[if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]],
})

-- GUI Neovide set
vim.g.neovide_transparency = 0.9
vim.o.guifont = "FiraCode Nerd Font:h12"


vim.api.nvim_create_autocmd('FileType', {
  group = group,
  pattern = { 'qf', 'help', 'man' },
  callback = function()
    vim.keymap.set('', 'q', '<CMD>q<CR>', { buffer = true })
  end,
})
