function! windows#load()
    let &shell = 'powershell'
    let &shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
    let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; $LastExitCode'
    let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; $LastExitCode'

    set shellquote=
    set shellxquote=

    set wildignore+=.git\*,.hg\*,.svn\*
endfunction
