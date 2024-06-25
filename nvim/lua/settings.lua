
local global = vim.g
local o = vim.o
local keymap_opts = { noremap = true }
local function open_nvim_tree()

  -- open the tree
  require("nvim-tree.api").tree.open()
end
vim.scriptencodings = 'utf-8'

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

global.mapleader = '-'
global.maplocalleader = '-'

require 'nvim-treesitter.install'.compilers = { "gcc" }
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
vim.api.nvim_create_augroup("neotree_autoopen", { clear = true })
vim.api.nvim_create_autocmd("BufRead", {
  desc = "Open neo-tree on enter",
  group = "neotree_autoopen",
  callback = function()
    if not vim.g.neotree_opened then
      vim.cmd "Neotree show"
      vim.g.neotree_opened = true
    end
  end,
})
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
vim.api.nvim_set_keymap('n', "<c-j>", "<c-w>j", keymap_opts)
vim.api.nvim_set_keymap('n', "<c-k>", "<c-w>k", keymap_opts)
vim.api.nvim_set_keymap('n', "<c-l>", "<c-w>l", keymap_opts)
vim.api.nvim_set_keymap('n', "<c-h>", "<c-w>h", keymap_opts)

local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

lsp_zero.format_on_save({
  format_opts = {
    async = false,
    timeout_ms = 10000,
  },
  servers = {
    ['zls'] = {'zig'},
  }
})
-- here you can setup the language servers


--- in your own config you should replace `example_server`
--- with the name of a language server you have installed
require("mason").setup()
require("mason-lspconfig").setup()
require('lspconfig').zls.setup{}
