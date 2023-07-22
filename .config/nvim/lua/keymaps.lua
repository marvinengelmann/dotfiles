local keymap = vim.keymap                                   -- Vim keymaps

-- Core Vim commands
keymap.set('n', '<leader>sx', ':nohl<CR>')                  -- Clear search highlighting

-- Hop plugin
keymap.set('n', '<leader><leader>', ':HopWord<CR>')         -- Navigate to word

-- Telescope plugin
keymap.set('n', '<leader>ff', ':Telescope find_files<CR>')  -- Find files
keymap.set('n', '<leader>fg', ':Telescope live_grep<CR>')   -- Search text in files

-- NvimTree plugin
keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>')         -- Toggle file explorer