" Plugin install directory
let s:plugin_dir = expand('~/.vim/plugged')

" Ensure plugin is installed and loaded
function! s:ensure(repo)
  let name = split(a:repo, '/')[-1]
  let path = s:plugin_dir . '/' . name

  " Clone plugin if missing
  if !isdirectory(path)
    if !isdirectory(s:plugin_dir)
      call mkdir(s:plugin_dir, 'p')
    endif
    execute '!git clone --depth=1 https://github.com/' . a:repo . ' ' . shellescape(path)
  endif

  " Add plugin to runtime path
  execute 'set runtimepath+=' . fnameescape(path)
endfunction

" Plugins
call s:ensure('ghifarit53/tokyonight-vim')
call s:ensure('junegunn/fzf')
call s:ensure('junegunn/fzf.vim')
call s:ensure('mbbill/undotree')
call s:ensure('itchyny/lightline.vim')

