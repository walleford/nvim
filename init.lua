require('plugins')
require('settings')

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
-- setting the leader to the - symbol
key_mapper('', '-','<leader>')
-- mapping 'jk' to the ESC key to leave insert mode
key_mapper('i', 'jk', '<ESC>')
-- next 4 are disabling the use of the arrow keys :) for your benefit i swear
key_mapper('', '<up>', '<nop>')
key_mapper('', '<down>', '<nop>')
key_mapper('', '<left>', '<nop>')
key_mapper('', '<right>', '<nop>')
