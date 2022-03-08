"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" init.vim
" -------------------------------------------------------
" All plugins are configured via the lua interface,
" and are compartmentalised into their own files in
" lua/.
"
" Basic options and general mappings are in Vimscript
" files, located in vim/
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Bindings
" -------------------------------------------------------
" Leader: space
"
" Misc:
"    Leader+w            Save File
"    Leader+W            Save All
"    Leader+z            Clear Search (Highlighting)
"
"
" Splits:
"    CTRL+SHIFT+LEFT     Move Left
"    CTRL+SHIFT+RIGHT    Move Right
"    CTRL+SHIFT+UP       Move Up
"    CTRL+SHIFT+DOWN     Move Down
"    Leader+h            Open Horizontal
"    Leader+v            Open Vertical
"
" Buffers:
"    CTRL+Right          Previous Buffer
"    CTRL+Left        	 Next Buffer
"    Leader+c            Close Buffer
"    Leader+d            Delete Buffer
"
" Formatter:
"    Leader+f            Format Buffer
"
" Diagnostics and LSP:
"    Leader+xx           Show Trouble
"    Leader+xw           Show Workspace Trouble
"    Leader+xd           Show Document Trouble
"    Leader+xl           Show Location List Trouble
"    Leader+xq           Show Quickfixes
"    ]g                  Next Diagnostic
"    [g                  Previous Diagnostic
"    Leader+la           Code Actions
"    Leader+ld           Definitions
"    Leader+le           Open Diagnostic Float
"    Leader+ll           Diagnostics
"    Leader+ln           Rename Buffer
"    Leader+lr           Show References
"    Leader+ls           Show Symbols
"    Leader+lt           Show Type Definitions
"    Leader+lw           Show Workplace Symbols
"
" Git:
"    Leader+gb           Show Git Branches
"    Leader+gc           Show Git Commits
"    Leader+gs           Show Git Status
"    Leader+gx           Show Git Blame
"    Leader+gg           Open Git
"    Leader+gf           Diff 1
"    Leader+gj           Diff 2
"    Leader+gp           Git Push
"
" Telescope:
"    Leader+tb           Telescope Buffers
"    Leader+tc           Telescope Command History
"    Leader+tf           Telescope Find Files
"    Leader+tg           Telescope Live Grep
"    Leader+th           Telescope Help
"    Leader+tj           Telescope Jump List
"    Leader+tm           Telescope Marks
"    Leader+ts           Telescope Search History
"    Leader+tt           Telescope File Browser
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

source ~/.config/nvim/vim/basics.vim
source ~/.config/nvim/vim/mappings.vim
source ~/.config/nvim/vim/plugins.vim

lua << EOF
require('color-scheme')
require('completion')
require('format')
require('git-integration')
require('indent-line')
require('lsp')
require('status-line')
require('tele-scope')
require('treesitter')
require('diag-trouble')
require('buffer-line')
require('signature')
require('tree')
EOF
