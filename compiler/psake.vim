" Psake in as "compiler"
if exists("current_compiler")
    finish
endif

let current_compiler = "psake"
setlocal makeprg=powershell\ -command\ invoke-psake
setlocal errorformat=%f:%l:%c:%m,%f:%m
