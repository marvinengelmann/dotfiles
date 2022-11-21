local keymap = vim.keymap -- Vim keymaps

keymap.set('n', '<leader><leader>', ':HopWord<CR>')         -- Hop to word
keymap.set('n', '<leader>sx', ':nohl<CR>')                  -- Clear search
keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>')         -- Toggle file explorer
keymap.set('n', '<leader>ff', ':Telescope find_files<CR>')  -- Find files
keymap.set('n', '<leader>fg', ':Telescope live_grep<CR>')   -- Find text