vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.textwidth = 0               -- Disable automatic text wrapping
vim.opt.colorcolumn = "80"
vim.opt.winwidth = 80               -- Minimum window width
vim.opt.winminwidth = 10            -- Allow flexibility in resizing
vim.opt.equalalways = false         -- Avoid automatic resizing of splits
vim.api.nvim_create_autocmd("FileType", {
        pattern = "help",
        callback = function()
            vim.cmd("only") -- Close all other windows when opening help
    end,
})
