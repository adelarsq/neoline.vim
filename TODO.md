

```vim
function! lightline#tab#modified(n) abort
  let winnr = tabpagewinnr(a:n)
  return gettabwinvar(a:n, winnr, '&modified') ? '+' : gettabwinvar(a:n, winnr, '&modifiable') ? '' : '-'
endfunction
```
https://github.com/itchyny/lightline.vim/blob/bc7e828f10b51da16c03452c871e5c5405312167/autoload/lightline/tab.vim#L18

