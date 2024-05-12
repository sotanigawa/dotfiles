local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        "Mofiqul/dracula.nvim",
        config = function()
            vim.cmd([[colorscheme dracula]])
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require("lualine").setup {
                options = {
                    icons_enabled = false,
                    theme = "dracula-nvim",
                }
            }
        end,
    },
    {
        "ntpeters/vim-better-whitespace",
    },
})

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
