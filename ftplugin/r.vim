let R_min_editor_width = 80   " Source editor should be at least 80 col
let R_rconsole_width = 1000   " Console takes up whole width
let R_rconsole_height = 20    " Console isn't too tall
let R_objbr_opendf = 0        " Don't expand dataframe in obj browser
let R_assign = 2              " 2 underscores inserts the assn. operator
nmap , <Plug>RDSendLine       " Comma sends current line in normal mode
vmap , <Plug>RESendSelection  " Comma sends current selection in visual mode

let R_filetypes = ['r', 'rmd', 'rrst', 'rnoweb', 'quarto', 'rhelp']

" let R_DEFAULT_PACKAGES = 'httpgd'
" let R_after_start = [':hgd()', ':hgd_browse()']

let R_csv_delim = ','

" let R_app = "radian"
" let R_cmd = "R"
" let R_hl_term = 0
" let R_args = []  
" let R_bracketed_paste = 1
