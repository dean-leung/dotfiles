require('nvim-tree')

vim.api.nvim_set_keymap('', '<C-n>', [[<cmd>lua require('nvim-tree').toggle()<cr>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>r', [[<cmd>lua require('nvim-tree').refresh()<cr>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>n', [[<cmd>lua require('nvim-tree').find_file()<cr>]], { noremap = true, silent = true })
