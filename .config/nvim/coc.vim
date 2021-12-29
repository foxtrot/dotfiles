" Escape closes the hover menu if open 
"unmap <Esc>
inoremap <expr> <Esc> pumvisible() ? "\<C-e>" : "\<Esc>"

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> <C-[> <Plug>(coc-diagnostic-prev)
nmap <silent> <C-]> <Plug>(coc-diagnostic-next)

"" Code navigation
" gd - Goto definition
nmap <silent> gd <Plug>(coc-definition)
" gy - Goto type definition
nmap <silent> gy <Plug>(coc-type-definition)
" gi - Goto implementation
nmap <silent> gi <Plug>(coc-implementation)
" gr - Show references
nmap <silent> gr <Plug>(coc-references)
" gh - Show hint
nnoremap <silent> gh :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <silent> f <Plug>(coc-format-selected)
nmap <silent> f <Plug>(coc-format-selected)
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ca  <Plug>(coc-codeaction-line)

" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
command! -nargs=? Unfold :execute "normal zR"

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Mappings for CoCList
" Show all diagnostics.
"nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
"nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
"nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
"nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
"nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
"nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
"nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
"nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

nnoremap <silent> <leader>z :<C-u>CocFzfList<CR>
nnoremap <silent> <leader>a :<C-u>CocFzfList actions<CR>
nnoremap <silent> <leader>d :<C-u>CocFzfList diagnostics<CR>
nnoremap <silent> <leader>b :<C-u>CocFzfList diagnostics --current-buf<CR>
nnoremap <silent> <leader>c :<C-u>CocFzfList commands<CR>
nnoremap <silent> <leader>l :<C-u>CocFzfList location<CR>
nnoremap <silent> <leader>o :<C-u>CocFzfList outline<CR>
nnoremap <silent> <leader>s :<C-u>CocFzfList symbols<CR>

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

