local opt = vim.opt                   -- Alias to modify Vim options
local g = vim.g                       -- Alias to modify Vim global variables

-- Display settings
opt.number = true                     -- Enable line numbers
opt.relativenumber = true             -- Show line numbers relative to the cursor position
opt.cursorline = true                 -- Highlight the line the cursor is on
opt.termguicolors = true              -- Enable true color support in terminal
opt.signcolumn = 'yes'                -- Always display the sign column to prevent shifting the text
opt.wrap = false                      -- Prevent automatic line wrap

-- Editing behavior
opt.tabstop = 4                       -- Number of spaces that a tab character represents
opt.shiftwidth = 4                    -- Number of spaces used for each indentation level
opt.expandtab = true                  -- Convert tab characters to spaces
opt.ignorecase = true                 -- Make searches case-insensitive
opt.smartcase = true                  -- Make case-insensitive search become case-sensitive when uppercase letter is used
opt.backspace = 'indent,eol,start'    -- Allow backspace key to delete over auto-indentation, line breaks, and start of insert action

-- Clipboard settings
opt.clipboard:append('unnamedplus')   -- Append to the clipboard register to enable system-wide clipboard access

-- Windowing settings
opt.splitright = true                 -- Open new vertical windows to the right of the current window
opt.splitbelow = true                 -- Open new horizontal windows below the current window

-- Global Vim settings
g.loaded_netrw = 1                    -- Disable the netrw file explorer to enhance startup performance
g.loaded_netrwPlugin = 1              -- Disable the netrw plugin to enhance startup performance
g.mapleader = ' '                     -- Define the leader key as a space for executing leader-key sequences
