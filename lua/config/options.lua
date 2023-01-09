local indent = 4

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.guifont = 'JetbrainsMono Nerd Font:h16'
if vim.fn.exists 'g:neovide' then
    vim.g.neovide_refresh_rate = 75
    vim.g.neovide_cursor_antialiasing = true
    vim.g.neovide_cursor_vfx_mode = 'railgun'
    vim.g.neovide_hide_mouse_when_typing = true
end

vim.opt.completeopt = 'menu,menuone,noinsert,noselect'
vim.wo.relativenumber = true
vim.wo.number = true
vim.wo.numberwidth = 1

vim.g.editorconfig = true

vim.o.tabstop = indent
vim.o.shiftwidth = indent
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.smartindent = true

vim.o.wrap = false
vim.o.hidden = true
vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = os.getenv 'HOME' .. '/.vim/undodir'
vim.o.undofile = true
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.termguicolors = true
vim.o.scrolloff = 8
vim.o.pumheight = 8
vim.wo.signcolumn = 'number'
vim.opt.isfname:append '@-@'
vim.o.updatetime = 250
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.cursorline = true
vim.o.cursorcolumn = false
vim.o.backspace = 'indent,eol,start'
vim.o.showcmd = false
vim.o.autoread = true
vim.o.splitright = true
vim.o.splitbelow = true
vim.opt.iskeyword:append '-'
vim.o.fileencoding = 'utf-8'
vim.o.conceallevel = 0
vim.o.showmode = false
vim.o.timeoutlen = 500
vim.o.cmdheight = 1
vim.o.virtualedit = 'all'
vim.o.list = false
vim.o.listchars = 'tab:→ ,leadmultispace:·,eol:↙'
vim.o.laststatus = 3
vim.o.ch = 1
