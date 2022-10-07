"stop nvim-r assigning shortcut
" let R_assign_map = '__'
let R_min_editor_width = 80   " Source editor should be at least 80 col
let R_rconsole_width = 1000   " Console takes up whole width
let R_rconsole_height = 20    " Console isn't too tall
let R_objbr_opendf = 0        " Don't expand dataframe in obj browser
let R_assign = 2              " 2 underscores inserts the assn. operator
nmap , <Plug>RDSendLine       " Comma sends current line in normal mode
vmap , <Plug>RESendSelection  " Comma sends current selection in visual mode
let R_csv_delim = ','
if os == "Linux"
    let R_csv_app = 'terminal:vd'
else
    let R_csv_app = 'terminal:wsl.exe -e vd' " visidata needs to be installed globally on wsl 
    " let R_csv_app = 'C:/Program Files/LibreOffice/program/scalc.exe'
    " let R_csv_app = 'C:/Program Files/Microsoft Office/root/Office16/EXCEL.EXE'
endif
