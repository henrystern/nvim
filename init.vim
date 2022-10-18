" reduces start time
lua require('impatient')

" detect OS
if !exists("g:os")
    if has("win64") || has("win32") || has("win16")
        let g:os = "Windows"
    else
        let g:os = substitute(system('uname'), '\n', '', '')
    endif
endif

" vim settings
exec 'source' stdpath("config") . '/modules/settings.vim'

" vim mappings
exec 'source' stdpath("config") . '/modules/mappings.vim'

" vim plug and vimscript plugin configuration
exec 'source' stdpath("config") . '/modules/plugins.vim'

" lua plugin setup
exec 'source' stdpath("config") . '/modules/setup.lua'

" for testing
exec 'source' stdpath("config") . '/modules/typingspeed.lua'
