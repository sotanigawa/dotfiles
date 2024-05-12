local Plug = vim.fn['plug#']

vim.call('plug#begin')
Plug('nvim-lualine/lualine.nvim')
Plug('ntpeters/vim-better-whitespace')
Plug('Mofiqul/dracula.nvim')
vim.call('plug#end')

require('lualine').setup {
    options = {
        icons_enabled = false,
    }
}

vim.opt.encoding = "utf-8"
vim.opt.number = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true

vim.cmd[[colorscheme dracula]]
