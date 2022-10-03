"
"testing typing speed
"
" imap <buffer> <expr> <F12> Double("\<F12>")
"autocmd! InsertEnter * call Double(0)
"function! Double(char_count) 
"  let char_count_temp = a:char_count
"  try
"    let char = getchar()
"  catch /^Vim:Interrupt$/
"    let char = "\<Esc>"
"  endtry
"  "exec BPBreakIf(char == 32, 1)
"  if char == '^\d\+$' || type(char) == 0
"    let char = nr2char(char)
"  endif " It is the ascii code.
"  if (char == "\<DEL>" || char == "\<BS>")
"	  let char_count_temp = char_count_temp - 1
"  elseif char == "\<Esc>"
"	echom char_count_temp
"	" let char_count_temp = 0
"    return ''
"  else
"	  let char_count_temp = char_count_temp + 1
"  endif
"  redraw
"  return ''
"endfunction

"function! Redraw()
"  redraw
"  return ''
"endfunction
