" Pester in as "compiler"
if exists("current_compiler")
    finish
endif

let current_compiler = "pester"
setlocal makeprg=powershell\ -command\ invoke-pester
setlocal errorformat=%f:%l:%c:%m,%f:%m
