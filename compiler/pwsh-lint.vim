" Vim compiler plugin file adapted from:
" Language:           Windows PowerShell
" Maintainer:         Jesse Harris <jesse@zigford.org>
" Contibuter:         Enno Nagel
" Version:            3.00
" Project Repository: https://github.com/zigford/vim-powershell
" Vim Script Page:    TBA
" License:
" Copyright 2005-2012 Peter Provost
"
" Licensed under the Apache License, Version 2.0 (the "License");
" you may not use this file except in compliance with the License.
" You may obtain a copy of the License at
"
" http://www.apache.org/licenses/LICENSE-2.0
"
" Unless required by applicable law or agreed to in writing, software
" distributed under the License is distributed on an "AS IS" BASIS,
" WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
" See the License for the specific language governing permissions and
" limitations under the License.

if exists('current_compiler') | finish | endif
    let current_compiler = 'pwsh'

if exists(':CompilerSet') != 2                " older Vim always used :setlocal
    command -nargs=* CompilerSet setlocal <args>
endif

let s:cpo_save = &cpo
set cpo&vim

if !exists("g:ps1_lintprg_cmd")
  if executable('pwsh')
    " pwsh is the future
    let g:ps1_lintprg_cmd = 'pwsh'
  elseif executable('pwsh.exe')
    let g:ps1_lintprg_cmd = 'pwsh.exe'
  elseif executable('powershell.exe')
    let g:ps1_lintprg_cmd = 'powershell.exe'
  else
    let g:ps1_lintprg_cmd = ''
  endif
endif

if !executable(g:ps1_lintprg_cmd)
  echoerr "To use the linter, please set g:ps1_lintprg_cmd to the powershell executable!"
  finish
endif

let &l:makeprg = g:ps1_lintprg_cmd
set makeprg+=\ -NoProfile\ -NoLogo\ -NonInteractive\ -command\ \"&{
    \trap{$_.tostring();continue}&{
    \[void]$executioncontext.invokecommand.invokescript('%')
    \}
\}\"
set makeprg+=\ %:p:S

silent CompilerSet makeprg
silent CompilerSet errorformat=%EAt\ %f:%l\ char:%c,%-C+%.%#,%Z%m,%-G\\s%#
