local M = {}

function M.toggle_current_fold()
  if vim.wo.foldmethod == 'manual' or vim.wo.foldmethod == 'marker' then
    if vim.fn.foldclosed('.') == -1 then
      vim.cmd('silent! normal! zC')
    else
      vim.cmd('silent! normal! zO')
    end
  else
    if vim.fn.foldclosed('.') == -1 then
      vim.cmd('silent! normal! zc')
    else
      vim.cmd('silent! normal! zo')
    end
  end
end

function M.toggle_all_folds()
  if vim.wo.foldlevel == 0 then
    vim.wo.foldlevel = 20
  else
    vim.wo.foldlevel = 0
  end
end

return M
