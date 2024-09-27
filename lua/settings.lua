
local global = vim.g
local o = vim.o
local keymap_opts = { noremap = true }
vim.scriptencodings = 'utf-8'

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

global.mapleader = '-'
global.maplocalleader = '-'

-- go plugin
require('go').setup()
-- Run gofmt + goimports on save

local format_sync_grp = vim.api.nvim_create_augroup("goimports", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').goimports()
  end,
  group = format_sync_grp,
})

-- random go remaps i like :)
vim.api.nvim_set_keymap('n', '<leader>gb', ':!make<CR>', keymap_opts)
vim.api.nvim_set_keymap('n', '<c-r>', ':Explore<CR>', keymap_opts)

-- other stuff
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
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
vim.api.nvim_set_keymap('n', "<c-j>", "<c-w>j", keymap_opts)
vim.api.nvim_set_keymap('n', "<c-k>", "<c-w>k", keymap_opts)
vim.api.nvim_set_keymap('n', "<c-l>", "<c-w>l", keymap_opts)
vim.api.nvim_set_keymap('n', "<c-h>", "<c-w>h", keymap_opts)
vim.api.nvim_set_keymap('i', "jk", "<esc>", keymap_opts)

-- lsp server configs
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
    ['go'] = {'gopls'},
  }
})
-- here you can setup the language servers


--- in your own config you should replace `example_server`
--- with the name of a language server you have installed
require("mason").setup()
require("mason-lspconfig").setup()
require('lspconfig').zls.setup{}
require('lspconfig').gopls.setup{}
require('lspconfig').marksman.setup{}
-- color scheme
vim.cmd("colorscheme rose-pine")
