" Vim ftdetect plugin file
" Language:	Windows PowerShell
" Maintainer:	Peter Provost <peter@provost.org>
" Version: 2.9
" Project Repository: https://github.com/PProvost/vim-ps1
" Vim Script Page: http://www.vim.org/scripts/script.php?script_id=1327

au BufNewFile,BufRead 	*.ps1 	set ft=ps1
au BufNewFile,BufRead 	*.psm1 	set ft=ps1
