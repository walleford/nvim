
local global = vim.g
local o = vim.o

local function open_nvim_tree()

  -- open the tree
  require("nvim-tree.api").tree.open()
end
vim.scriptencodings = 'utf-8'

global.mapleader = '-'
global.maplocalleader = '-'

require 'nvim-treesitter.install'.compilers = { "clang" }
o.number = true -- print line numbers
o.relativenumber = true -- print relative line numbers
o.syntax = 'on'
o.autoindent = true
o.cursorline = true
o.expandtab = true -- in insert mode, use appropriate number of spaces
o.shiftwidth = 4 -- use 2 spaces for auto indent
o.tabstop = 4 -- number of spaces to use for tab
o.encoding = 'utf-8'
o.ruler = true

