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
" Splits:
"    CTRL+SHIFT+LEFT     Move Left
"    CTRL+SHIFT+RIGHT    Move Right
"    CTRL+SHIFT+UP       Move Up
"    CTRL+SHIFT+DOWN     Move Down
"    Leader+s            Open Horizontal
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
"    gh                  Show Signature
"    ga                  Code Actions
"    gd                  Definitions
"    ge                  Open Diagnostic Float
"    gl                  Diagnostics
"    gn                  Rename Buffer
"    gr                  Show References
"    gs                  Show Symbols
"    gt                  Show Type Definitions
"    gw                  Show Workplace Symbols
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

lua << EOF
-- Basics & Mappings
require('basics')
require('mappings')
require('overrides')

-- Packer
require('plugins/plugins')

-- Mason
require('plugins/mason-menu')

-- Colorscheme & Theme
require('theme/colorscheme')

-- Line
require('plugins/buffer-line')
require('plugins/status-line')

-- File Navigation
require('plugins/tree')
require('plugins/tele-scope')

-- Source Code Management
require('plugins/git-integration')
require('plugins/format')

-- LSP & Diagnostics
require('lsp')
require('lsp/tree-sitter')
require('lsp/signature')
require('lsp/completion')
require('lsp/diagnostics')

-- Google
pcall(require, 'google')

EOF
