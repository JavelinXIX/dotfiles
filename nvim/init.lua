local api

-- vim options
vim.cmd("syntax on")
vim.cmd("set number")
vim.cmd("set expandtab")
vim.cmd("set smartindent")
vim.cmd("set shiftwidth=4")
vim.cmd("set softtabstop=4")
vim.cmd("set tabstop=4")
vim.cmd("set cursorline")
vim.cmd("set nowritebackup")
vim.cmd("set nobackup")
vim.cmd("set shell=/usr/bin/zsh")
vim.cmd("set clipboard=unnamedplus")
vim.opt.laststatus = 3

-- keymap
vim.keymap.set("n", "<C-Up>",    ":resize -2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Down>",  ":resize +2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Left>",  ":vertical resize -2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { noremap = true, silent = true })


-- lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


-- packages
plugins = require('plugins')
require("lazy").setup(plugins)

vim.cmd("colorscheme nightfox")
