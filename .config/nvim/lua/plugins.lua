local ensure_packer = function()
    local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

    if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
        vim.fn.system({
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

local packer_bootstrap = ensure_packer()

vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerCompile
    augroup end
]])

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'github/copilot.vim'
    use 'lukas-reineke/indent-blankline.nvim'

    use {
        'projekt0n/github-nvim-theme',
        config = function()
            require('github-theme').setup({
                options = {
                    transparent = true,
                    styles = {
                        comments = 'italic',
                        functions = 'NONE',
                        keywords = 'italic',
                        variables = 'NONE',
                        conditionals = 'NONE',
                        constants = 'NONE',
                        numbers = 'NONE',
                        operators = 'NONE',
                        strings = 'NONE',
                        types = 'NONE'
                    }
                }
            })

            vim.cmd('colorscheme github_dark')
        end
    }

    use {
        'nvim-lualine/lualine.nvim',
        config = function()
            require('lualine').setup()
        end
    }

    use {
        'nvim-tree/nvim-tree.lua',
        config = function()
            require('nvim-tree').setup()
        end
    }

    use {
        'phaazon/hop.nvim',
        config = function()
            require('hop').setup()
        end
    }

    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            'neovim/nvim-lspconfig',
            'williamboman/mason-lspconfig.nvim',
            'hrsh7th/nvim-cmp',
            'hrsh7th/cmp-nvim-lsp',
            'L3MON4D3/LuaSnip',
            {
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.api.nvim_command, 'MasonUpdate')
                end
            }
        },
        config = function()
            local lsp = require('lsp-zero').preset('recommended')

            lsp.on_attach(function(client, bufnr)
                lsp.default_keymaps({
                    buffer = bufnr
                })
            end)

            lsp.ensure_installed({
                'lua_ls',
                'bashls',
                'jsonls',
                'html',
                'emmet_ls',
                'cssls',
                'tailwindcss',
                'eslint',
                'tsserver',
                'svelte',
                'intelephense',
                'rust_analyzer',
                'terraformls',
                'yamlls'
            })

            lsp.setup()

            require('lspconfig').lua_ls.setup({
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = {
                                'vim'
                            }
                        },
                        workspace = {
                            checkThirdParty = false,
                            library = vim.api.nvim_get_runtime_file("", true)
                        }
                    }
                }
            })
        end
    }

    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                run = 'make'
            }
        },
        config = function()
            require('telescope').setup({
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = 'smart_case'
                }
            })

            require('telescope').load_extension('fzf')
        end
    }

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

    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true

            require("which-key").setup()
        end
    }

    use {
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup({
                check_ts = true
            })
        end
    }

    use {
        'windwp/nvim-ts-autotag',
        config = function()
            require('nvim-ts-autotag').setup()
        end
    }

    if packer_bootstrap then
        require('packer').sync()
    end
end)
