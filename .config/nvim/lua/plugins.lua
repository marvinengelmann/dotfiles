local fn = vim.fn -- Access Vim functions

-- Function to ensure packer is installed
local ensure_packer = function()
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

    -- If packer isn't installed, install it
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({
            'git',
            'clone',
            '--depth',
            '1',
            'https://github.com/wbthomason/packer.nvim',
            install_path
        })
        vim.cmd [[packadd packer.nvim]]
        return true
    end

    return false
end

-- Automatically recompiles when there are changes in plugins.lua
vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerCompile
    augroup end
]])

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim' -- Packer can manage itself
    use 'github/copilot.vim' -- GitHub Copilot for AI-assisted coding
    use 'lukas-reineke/indent-blankline.nvim' -- Display indentation levels with lines

    -- GitHub theme for color scheme
    use {
        'projekt0n/github-nvim-theme',
        config = function()
            require('github-theme').setup({
                options = {
                    transparent = true
                }
            })

            vim.cmd('colorscheme github_dark_high_contrast')
        end
    }

    -- File explorer plugin
    use {
        'nvim-tree/nvim-tree.lua',
        config = function()
            require('nvim-tree').setup()
        end
    }

    -- Status line enhancement plugin
    use {
        'nvim-lualine/lualine.nvim',
        config = function()
            require('lualine').setup()
        end
    }

    -- Quick motion within the file using the Hop plugin
    use {
        'phaazon/hop.nvim',
        config = function()
            require('hop').setup()
        end
    }

    -- Fuzzy finder plugin for quickly finding files and text
    use {
        'nvim-telescope/telescope.nvim',
        config = function()
            require('telescope').setup({
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true
                }
            })

            require('telescope').load_extension('fzf')
        end,
        requires = {
            'nvim-lua/plenary.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                run = 'make'
            }
        }
    }

    -- Syntax highlighting with Tree-sitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            require('nvim-treesitter.install').update({
                with_sync = true
            })

            require('nvim-treesitter.configs').setup({
                autotag = {
                    enable = true
                }
            })
        end
    }

    -- Auto close HTML/XML tags
    use {
        'windwp/nvim-ts-autotag',
        config = function()
            require('nvim-ts-autotag').setup()
        end
    }

    -- Auto pairs for programming language constructs like (), {}, "", etc.
    use {
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup({
                check_ts = true
            })
        end
    }

    -- Displays a popup with possible keybindings
    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            require("which-key").setup()
        end
    }

    -- Sync if packer was installed
    if packer_bootstrap then
        require('packer').sync()
    end
end)
