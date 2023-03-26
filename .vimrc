" Custom yank mapping for Wayland clipboard
noremap <silent> y y:call YankToWaylandClipboard()<CR>
vnoremap <silent> y y:call YankToWaylandClipboard(1)<CR>

function! YankToWaylandClipboard(...) abort
  let l:visual_mode = a:0 ? 1 : 0
  if l:visual_mode
    normal! gvy
  endif
  let l:register = @@
  call system('echo -n ' . shellescape(l:register) . ' | wl-copy', '/dev/null')
  if l:visual_mode
    normal! gv
  endif
endfunction
