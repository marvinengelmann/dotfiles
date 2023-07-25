local keymap = vim.keymap -- Vim keymaps

-- Core Vim commands
keymap.set('n', '<leader>cs', ':nohl<CR>', { desc = '[C]lear [S]earch' }) -- Clear search highlighting

-- Hop plugin
keymap.set('n', '<leader><leader>', ':HopWord<CR>', { desc = 'Hop' }) -- Navigate to word

-- Telescope plugin
keymap.set('n', '<leader>ff', ':Telescope find_files<CR>', { desc = '[F]ind [F]iles]' }) -- Find files
keymap.set('n', '<leader>fg', ':Telescope live_grep<CR>', { desc = '[F]ind [G]rep]' }) -- Search text in files

-- NvimTree plugin
keymap.set('n', '<leader>s', ':NvimTreeToggle<CR>', { desc = 'Toggle [S]idebar' }) -- Toggle file explorer