vim.keymap.set('n', '<leader><leader>', ':HopWord<CR>', {
    desc = 'Hop to word'
})

vim.keymap.set('n', '<leader>h', '<C-w>h', {
    desc = 'Move window left'
})

vim.keymap.set('n', '<leader>j', '<C-w>j', {
    desc = 'Move window bottom'
})

vim.keymap.set('n', '<leader>k', '<C-w>k', {
    desc = 'Move window top'
})

vim.keymap.set('n', '<leader>l', '<C-w>l', {
    desc = 'Move window right'
})

vim.keymap.set('n', '<leader>s', ':NvimTreeToggle<CR>', {
    desc = 'Toggle Sidebar'
})

vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>', {
    desc = 'Find files'
})

vim.keymap.set('n', '<leader>ft', ':Telescope live_grep<CR>', {
    desc = 'Find text'
})
