vim.cmd [[
  augroup _general_settings
    autocmd!
    autocmd FileType qf nnoremap <silent> <buffer> <cr> <cr>:cclose<cr> 
  augroup end
]]