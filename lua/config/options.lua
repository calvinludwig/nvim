local g = vim.g
local opt = vim.opt

g.mapleader = " "
g.maplocalleader = " "
g.editorconfig = true

opt.autowrite = true -- enable auto write
opt.cmdheight = 1
opt.completeopt = 'menu,menuone,noinsert,noselect'
opt.conceallevel = 3 -- Hide * markup for bold and italic
opt.confirm = true -- confirm to save changes before exiting modified buffer
opt.cursorline = true -- Enable highlighting of the current line

opt.expandtab = false -- Use spaces instead of tabs
opt.shiftround = true -- Round indent
opt.shiftwidth = 4 -- Size of an indent
opt.tabstop = 4 -- Number of spaces tabs count for

opt.formatoptions = "jcroqlnt" -- tcqj
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.hidden = true
opt.hidden = true -- Enable modified buffers in background
opt.ignorecase = true -- Ignore case
opt.inccommand = "nosplit" -- preview incremental substitute
opt.joinspaces = false -- No double spaces with join after a dot
opt.laststatus = 3
opt.list = false -- Show some invisible characters (tabs...
opt.listchars = Icons.listchars
opt.fillchars = Icons.fillchars
opt.mouse = "a" -- enable mouse mode
opt.number = true -- Print line number
opt.pumblend = 10 -- Popup blend
opt.pumheight = 10 -- Maximum number of entries in a popup
opt.relativenumber = true -- Relative line numbers
opt.scrolloff = 8 -- Lines of context
opt.sidescrolloff = 8 -- Columns of context
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
opt.showmode = false -- dont show mode since we have a statusline
opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
opt.smartcase = true -- Don't ignore case with capitals
opt.smartindent = true -- Insert indents automatically
opt.splitbelow = true -- Put new windows below current
opt.splitright = true -- Put new windows right of current
opt.termguicolors = true -- True color support
opt.timeoutlen = 300
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200 -- save swap file and trigger CursorHold
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.winminwidth = 5 -- minimum window width
opt.wrap = false -- Disable line wrap

opt.foldenable = true
opt.foldlevel = 99 -- was 1
opt.foldlevelstart = 99
opt.foldnestmax = 10

opt.hlsearch = true
opt.incsearch = true
opt.isfname:append '@-@'
opt.backspace = 'indent,eol,start'
opt.iskeyword:append '-'
opt.fileencoding = 'utf-8'
opt.virtualedit = 'block'
opt.ch = 1

if vim.fn.has("nvim-0.9.0") == 1 then
	opt.splitkeep = "screen"
	opt.shortmess = "filnxtToOFWIcC"
end

-- fix markdown indentation settings
g.markdown_recommended_style = 0
