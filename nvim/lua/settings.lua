local opt = vim.opt                     -- Vim options
local g = vim.g                         -- Vim gobal variables

opt.number = true                       -- Show line numbers 
opt.relativenumber = true               -- Show line numbers relative to current line
opt.tabstop = 4                         -- Insert 4 spaces for a tab
opt.shiftwidth = 4                      -- Change the number of space characters inserted for indentation
opt.expandtab = true                    -- Converts tabs to spaces
opt.wrap = false                        -- Disable line wrap
opt.ignorecase = true                   -- Ignore case when searching
opt.smartcase = true                    -- 
opt.cursorline = true                   -- Enable highlighting of the current line
opt.termguicolors = true                -- True color support
opt.signcolumn = 'yes'                  -- Always show the signcolumn, otherwise it would shift the text each time
opt.backspace = 'indent,eol,start'      -- Make backspace in insert mode behave as in most other editors
opt.clipboard:append('unnamedplus')     -- Copy paste between vim and everything else
opt.splitright = true                   -- Put new windows to the right
opt.splitbelow = true                   -- Put new windows below

g.loaded_netrw = 1                      -- Disable netrw 
g.loaded_netrwPlugin = 1                -- Disable netrw plugin
g.mapleader = " "                       -- Leader key
