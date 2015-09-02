augroup set_syntax
  autocmd!

  " rb
  autocmd BufRead,BufNewFile Schemafile setfiletype ruby
  autocmd BufRead,BufNewFile *.schema setfiletype ruby
augroup END
