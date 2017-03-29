" Vim filetype plugin file
" Language:           Windows PowerShell
" Maintainer:         Peter Provost <peter@provost.org>
" Version:            2.10
" Project Repository: https://github.com/PProvost/vim-ps1
" Vim Script Page:    http://www.vim.org/scripts/script.php?script_id=1327

" Only do this when not done yet for this buffer
if exists("b:did_ftplugin") | finish | endif

" Don't load another plug-in for this buffer
let b:did_ftplugin = 1

setlocal tw=0
setlocal commentstring=#%s
setlocal formatoptions=tcqro

" Change the browse dialog on Win32 to show mainly PowerShell-related files
if has("gui_win32")
  let b:browsefilter = 
        \ "All PowerShell Files (*.ps1, *.psd1, *.psm1, *.ps1xml)\t*.ps1;*.psd1;*.psm1;*.ps1xml\n" .
        \ "PowerShell Script Files (*.ps1)\t*.ps1\n" .
        \ "PowerShell Module Files (*.psd1, *.psm1)\t*.psd1;*.psm1\n" .
        \ "PowerShell XML Files (*.ps1xml)\t*.ps1xml\n" .
        \ "All Files (*.*)\t*.*\n"
endif

" Undo the stuff we changed
let b:undo_ftplugin = "setlocal tw< cms< fo<" .
      \ " | unlet! b:browsefilter"

