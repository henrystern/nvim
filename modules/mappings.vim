inoremap ii <esc>
tnoremap ii <c-\><c-n>
map <Space> <Leader>

inoremap <C-a> <esc>0i
inoremap <C-e> <esc>$a
inoremap <C-d> <delete>

nnoremap o o<esc>
nnoremap O O<esc>

" for Colemak
" nnoremap h j
" nnoremap j h
" nnoremap dh dj
" nnoremap dj dh
" nnoremap <c-w>h <c-w>j
" nnoremap <c-w>j <c-w>h
" vnoremap h j
" vnoremap j h

nnoremap <silent> <Tab> :bn<CR>
nnoremap <silent> <leader><Tab> :tabnext<CR>
nnoremap <silent> <leader>n <c-w><c-w>
nnoremap <silent> <leader>w :w<CR>
nnoremap <silent> <leader>q :q<CR>
nnoremap <silent> <leader>c :bd<CR>
nnoremap <silent><expr> <Leader>h (&hls && v:hlsearch ? ':nohls' : ':set hls')."\n"
nnoremap <silent> <leader>rr :source $MYVIMRC<cr>
nnoremap <silent> <leader>re :edit $MYVIMRC<cr>
nnoremap <leader>ds :setlocal spell! spelllang=en_ca<CR>
inoremap <c-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" plugin specific
nnoremap <silent> <leader>e :NvimTreeToggle<CR>

nmap <silent> <leader>/ gcc
vmap <leader>/ gc

nnoremap   <silent>   <leader>!    :FloatermNew<CR>
tnoremap   <silent>   `    <C-\><C-n>:FloatermNext<CR>
nnoremap   <silent>   <C-t>   :FloatermToggle<CR>
tnoremap   <silent>   <C-t>   <C-\><C-n>:FloatermToggle<CR>
let g:floaterm_title = '$1/$2'

nnoremap <silent> <leader>ru :UltiSnipsEdit!<cr>

nnoremap <leader>bf :Neoformat<cr>

nnoremap <leader>db :lua require'dap'.toggle_breakpoint()<cr>
nnoremap <F5> :lua require'dap'.continue()<CR>1
nnoremap <F6> :lua require'dap'.run_to_cursor()<CR>
nnoremap <F9> :lua require'dap'.step_back()<CR>
nnoremap <F10> :lua require'dap'.step_over()<CR>
nnoremap <F11> :lua require'dap'.step_into()<CR>
nnoremap <F12> :lua require'dap'.step_out()<CR>

nnoremap <leader>dx <cmd>TroubleToggle document_diagnostics<cr> 
nnoremap <leader>df <cmd>TroubleToggle quickfix<cr> 

nnoremap <leader>du <cmd>lua require("dapui").toggle()<cr> 

nnoremap <leader>f <cmd>HopWord<cr>
nnoremap <leader>T <cmd>HopPattern<cr>
nnoremap <leader>t <cmd>HopChar1<cr>
onoremap <leader>f <cmd>HopWord<cr>
onoremap <leader>T <cmd>HopPattern<cr>
onoremap <leader>t <cmd>HopChar1<cr>
