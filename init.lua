local execute = vim.api.nvim_command
local fn = vim.fn
local fmt = string.format

local pack_path = fn.stdpath("data") .. "/site/pack"

vim.opt["tabstop"] = 4
vim.opt["shiftwidth"] = 4
vim.opt["number"] = true
vim.o.autoindent = true
vim.bo.autoindent = true
vim.wo.wrap = false

-- ensure a given plugin from github.com/<user>/<repo> is cloned in the pack/packer/start directory
local function ensure (user, repo)
  local install_path = fmt("%s/packer/start/%s", pack_path, repo)
  if fn.empty(fn.glob(install_path)) > 0 then
    execute(fmt("!git clone https://github.com/%s/%s %s", user, repo, install_path))
    execute(fmt("packadd %s", repo))
  end
end

-- ensure the plugin manager is installed
ensure("wbthomason", "packer.nvim")

require('packer').startup(function(use)
  -- install all the plugins you need here

  -- the plugin manager can manage itself
  use {'wbthomason/packer.nvim'}

  --extra hightlighting
  use {'HerringtonDarkholme/yats.vim'}
  use {'maxmellon/vim-jsx-pretty'}

  --lsp
  use {'williamboman/mason.nvim'}
  use {'williamboman/mason-lspconfig.nvim'}
  use {'neovim/nvim-lspconfig'}
  use {"https://git.sr.ht/~whynothugo/lsp_lines.nvim"}
  use {"scalameta/nvim-metals",
  	requires = {
		'nvim-lua/plenary.nvim'
	}
  }
  --cmp
  use {'hrsh7th/nvim-cmp'}
  use {'hrsh7th/cmp-nvim-lsp'}
  use {'hrsh7th/cmp-buffer'}
  use {'hrsh7th/cmp-path'}
  use {'hrsh7th/cmp-cmdline'}
  use {'hrsh7th/vim-vsnip'}
  use {'hrsh7th/cmp-vsnip'}
  --treesitter
  use {'nvim-treesitter/nvim-treesitter'}

  --theme
  use {'folke/tokyonight.nvim'}
  --hardline
  use {'ojroques/nvim-hardline'}
  --file explorer
  use {'nvim-tree/nvim-tree.lua'}
  use {'nvim-tree/nvim-web-devicons'}

  --windows
  use {'anuvyklack/windows.nvim',
  	requires = {
		'anuvyklack/middleclass',
		'anuvyklack/animation.nvim'}
	}
  --git
  use {'kdheepak/lazygit.nvim',
    requires = {
		'nvim-lua/plenary.nvim',
	}
  }
  --util
  use {'m4xshen/autoclose.nvim'}
end)

require('keymap')
require('util/window')
require('util/nvimtree')
require('lsp/lsp')
require('lsp/cmp')
require('lsp/treesitter')
require('theme')
require('autoclose').setup()
