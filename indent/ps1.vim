" Vim indent file
" Language: Windows PowerShell
" Maintainer: Peter Provost <peter@provost.org>
" Version: 1.0
"
" $LastChangedDate $
" $Rev 	$

" Only load this indent file when no other was loaded.
if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

" PS indenting is like indenting C
setlocal cindent cinoptions& cinoptions+=+0

let b:undo_indent = "setl cin<"
