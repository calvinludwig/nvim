if has('termguicolors')
    set termguicolors
endif

set nu

call plug#begin(stdpath('data') . '/plugged')
    Plug 'sainnhe/gruvbox-material'
call plug#end()

set background=dark
let g:gruvbox_material_enable_italic = 1
let g:gruvbox_material_disable_italic_comment = 1
colorscheme gruvbox-material
