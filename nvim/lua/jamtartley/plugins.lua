local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  use {'/usr/local/opt/fzf'}
  use {'airblade/vim-gitgutter'}
  use {'dracula/vim', as = 'dracula'}
  use {'jose-elias-alvarez/null-ls.nvim'}
  use {'jose-elias-alvarez/nvim-lsp-ts-utils'}
  use {'junegunn/fzf.vim'}
  use {'neovim/nvim-lspconfig'}
  use {'nvim-lua/plenary.nvim'}
  use {'scrooloose/nerdtree'}
  use {'scrooloose/nerdcommenter'}
  use {'tpope/vim-fugitive'}
  use {'vim-airline/vim-airline'}
  use {'vim-airline/vim-airline-themes'}
  use {'Xuyuanp/nerdtree-git-plugin'}

  if packer_bootstrap then
    require('packer').sync()
  end
end)