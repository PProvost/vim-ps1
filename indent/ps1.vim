" Vim indent file
" Language:           Windows PowerShell
" Maintainer:         Peter Provost <peter@provost.org>
" Version:            2.10
" Project Repository: https://github.com/PProvost/vim-ps1
" Vim Script Page:    http://www.vim.org/scripts/script.php?script_id=1327"

" Only load this indent file when no other was loaded.
if exists("b:did_indent")
	finish
endif
let b:did_indent = 1

setlocal cindent
" Disable zero indentation of lines started with "#" in insert mode, which are comments
setlocal cinkeys-=0#
" Enable detection of Shell/Perl style comments
setlocal cinoptions+=#1
" Disable additonal indentation for "continuation lines", which are all the lines missing ";"
setlocal cinoptions+=+0
" Make indentation single for unclosed parentheses (multiline argument lists and array literals).
" By default it's shiftwidth * 2
execute "setlocal cinoptions+=(" . &shiftwidth

let b:undo_indent = "setl cindent< cinkeys< cinoptions<"
