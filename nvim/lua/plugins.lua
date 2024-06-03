return {
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        config = function()
            require('nvim-tree').setup()
        end
    },
    {
        'akinsho/toggleterm.nvim',
        version = '*',
        config = function()
            require('toggleterm').setup()
        end
    },
    {
        'glepnir/template.nvim',
        cmd = {'Template','TemProject'},
        config = function()
            require('template').setup({
                temp_dir = "~/Documents/github/template/files"
            })
        end
    },
    {
        'nvim-treesitter/nvim-treesitter',
        config = function()
            local configs  = require("nvim-treesitter.configs")
            configs.setup({
                ensure_installed = { "rust", "lua", "vim", "html", "python", "typst", "markdown" },
                sync_install = false,
                highlight = { 
                    enable = true,
                    additional_vim_regex_highlighting = false
                },
                indent = { enable = true }
            })
        end
    },
    {
        'EdenEast/nightfox.nvim',
        config = function()
            require('nightfox').setup()
        end
    }  
}

