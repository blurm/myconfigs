let s:self = {}

" see: man 3 strftime
function! s:self.current_time() abort
  return strftime('%I:%M %p')   
endfunction


function! damonvim#api#time#get() abort
    return deepcopy(s:self)
endfunction
