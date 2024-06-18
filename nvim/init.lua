require('settings')
require('plugins')

vim.o.smartcase = true
vim.o.undofile = true

-- setting the leader for custom mappings
local key_mapper = function(mode, key, result)
	vim.api.nvim_set_keymap(
	mode,
	key,
	result,
	{noremap = true, silent = true}
	)
end
local function open_nvim_tree()

  -- open the tree
  require("nvim-tree.api").tree.open()
end

key_mapper('', '-','<leader>')
key_mapper('i', 'jk', '<ESC>')
key_mapper('', '<up>', '<nop>')
key_mapper('', '<down>', '<nop>')
key_mapper('', '<left>', '<nop>')
key_mapper('', '<right>', '<nop>')
