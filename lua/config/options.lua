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

-- vim.opt.relativenumber = true
-- vim.opt.number = true
-- vim.opt.numberwidth = 2

vim.g.editorconfig = true

vim.opt.foldenable = true
vim.opt.foldlevel = 99 -- was 1
vim.opt.foldlevelstart = 99
vim.opt.foldnestmax = 10

vim.opt.mouse = 'a'

vim.opt.tabstop = indent
vim.opt.shiftwidth = indent
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.wrap = false
vim.opt.hidden = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv 'HOME' .. '/.vim/undodir'
vim.opt.undofile = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 4
vim.opt.pumheight = 8
vim.opt.signcolumn = 'number'
vim.opt.isfname:append '@-@'
vim.opt.updatetime = 250
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.cursorline = false
vim.opt.cursorcolumn = false

vim.opt.backspace = 'indent,eol,start'
vim.opt.showcmd = false
vim.opt.autoread = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.iskeyword:append '-'
vim.opt.fileencoding = 'utf-8'
vim.opt.conceallevel = 0
vim.opt.showmode = false
vim.opt.timeoutlen = 500
vim.opt.cmdheight = 1
vim.opt.virtualedit = 'all'
vim.opt.list = true
vim.opt.listchars = Icons.listchars

vim.opt.laststatus = 3
vim.opt.fillchars = Icons.fillchars

vim.opt.ch = 1
