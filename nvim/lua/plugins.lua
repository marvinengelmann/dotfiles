local fn = vim.fn -- Vim functions

-- Ensure packer is installed
local ensure_packer = function() 
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

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

-- Auto compile when there are changes in plugins.lua
vim.cmd([[ 
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerCompile
    augroup end
]])

-- Setup packer plugins
return require('packer').startup(function(use)  
    use 'wbthomason/packer.nvim'                -- Package manager
    use 'github/copilot.vim'                    -- GitHub Copilot
    use "lukas-reineke/indent-blankline.nvim"   -- Indentation lines
    
    use ({
        'projekt0n/github-nvim-theme',          -- GitHub colorscheme
        config = function()
            require('github-theme').setup({
                theme_style = "dark_default"
            })
        end
    })    

    use ({
        'nvim-tree/nvim-tree.lua',              -- File explorer
        config = function()
            require('nvim-tree').setup()
        end
    })

    use ({ 
        'nvim-lualine/lualine.nvim',            -- Status line
        config = function()
            require('lualine').setup()
        end
    })

    use ({
        'phaazon/hop.nvim',                     -- Easy motion
        config = function()
            require('hop').setup()
        end
    })

    use ({
        'nvim-telescope/telescope.nvim',        -- Fuzzy finder   
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
            {'nvim-lua/plenary.nvim'},
            {
                'nvim-telescope/telescope-fzf-native.nvim', 
                run = 'make' 
            }
        }
    })

    use {
        'nvim-treesitter/nvim-treesitter',      -- Syntax highlighting
        run = function()
            require('nvim-treesitter.install').update({ 
                with_sync = true 
            })

            require('nvim-treesitter.configs').setup({
                autotag = {
                    enable = true,
                }
            })
        end
    }

    use ({
        'windwp/nvim-ts-autotag',               -- Auto close tags
        config = function()
            require('nvim-ts-autotag').setup()
        end
    })

    use ({
        'windwp/nvim-autopairs',                -- Auto pairs
        config = function()
            require('nvim-autopairs').setup({
                check_ts = true
            })
        end
    })

    if ensure_packer() then
        require('packer').sync()
    end
end)

