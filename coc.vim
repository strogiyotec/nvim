set hidden 
set nobackup
set nowritebackup

set updatetime=200 " Make it faster

set shortmess+=c

"Integrate with nvim-bqf
let g:coc_enable_locationlist = 0
aug Coc
    au!
    au User CocLocationsChange ++nested call Coc_qf_jump2loc(g:coc_jump_locations)
aug END



" ctrl space triiger coc
inoremap <silent><expr> <c-space> 
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<c-space>" :
      \ coc#refresh()


function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<leader><j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<leader><k>'

nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gI <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> <leader>n <Plug>(coc-diagnostic-next-error)

nmap <F6> <Plug>(coc-rename)
nmap <silent> <leader>a <Plug>(coc-codeaction)

" Autoimport on save
autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')

function! Coc_qf_diagnostic() abort
    let diagnostic_list = CocAction('diagnosticList')
    let items = []
    let loc_ranges = []
    for d in diagnostic_list
        let text = printf('[%s%s] %s', (empty(d.source) ? 'coc.nvim' : d.source),
                    \ (d.code ? ' ' . d.code : ''), split(d.message, '\n')[0])
        let item = {'filename': d.file, 'lnum': d.lnum, 'col': d.col, 'text': text, 'type':
                    \ d.severity[0]}
        call add(loc_ranges, d.location.range)
        call add(items, item)
    endfor
    call setqflist([], ' ', {'title': 'CocDiagnosticList', 'items': items,
                \ 'context': {'bqf': {'lsp_ranges_hl': loc_ranges}}})
    botright copen
endfunction

function! Coc_qf_jump2loc(locs) abort
    let loc_ranges = map(deepcopy(a:locs), 'v:val.range')
    call setloclist(0, [], ' ', {'title': 'CocLocationList', 'items': a:locs,
                \ 'context': {'bqf': {'lsp_ranges_hl': loc_ranges}}})
    let winid = getloclist(0, {'winid': 0}).winid
    if winid == 0
        aboveleft lwindow
    else
        call win_gotoid(winid)
    endif
endfunction


"Golang
nmap <silent> <leader>gut :CocCommand go.test.generate.file<cr>

"Snippets
xmap <leader>x  <Plug>(coc-convert-snippet)


