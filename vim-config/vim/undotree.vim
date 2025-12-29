" Enable persistent undo
if has("persistent_undo")
  let target_path = expand('~/.undodir')

  " Create undo directory if missing
  if !isdirectory(target_path)
    call mkdir(target_path, "p", 0700)
  endif

  let &undodir = target_path
  set undofile
endif

" Toggle Undotree and focus its window
function! ToggleUndotreeAndFocus()
  UndotreeToggle

  " Move cursor to undotree window
  for w in range(1, winnr('$'))
    if getwinvar(w, '&filetype') ==# 'undotree'
      execute w . 'wincmd w'
      return
    endif
  endfor
endfunction

" Undotree window layout
if !exists('g:undotree_WindowLayout')
  let g:undotree_WindowLayout = 1
endif

" Undotree window width
let g:undotree_SplitWidth =
      \ get(g:, 'undotree_SplitWidth',
      \     get(g:, 'undotree_ShortIndicators', 0) ? 34 : 40)

