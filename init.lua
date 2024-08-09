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

require("lazy.lazy")
require("nvim-ts-autotag").setup()

require('keymap')
require('util/window')
require('util/nvimtree')
require('lsp/lsp')
require('lsp/cmp')
require('lsp/treesitter')
require('theme')
