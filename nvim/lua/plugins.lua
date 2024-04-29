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
    }

-- lazy load you can use cmd or ft. if you are using cmd to lazyload when you edit the template file
-- you may see some diagnostics in template file. use ft to lazy load the diagnostic not display
-- when you edit the template file.
}

