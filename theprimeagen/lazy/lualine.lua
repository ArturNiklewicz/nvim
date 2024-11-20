return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local lualine = require("lualine")
        local lazy_status = require("lazy.status") -- to configure lazy pending updates count

        vim.opt.laststatus = 3
        lualine.get_config()
        lualine.setup({
            options = {
                disabled_filetypes = { "no-neck-pain" },
                theme = "rose-pine"
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch", { "diagnostics", sources = { "nvim_diagnostic" } } },
                lualine_c = { { "filename", path = 2 }, { "lsp_progress" } },
                lualine_x = {
                    {
                        lazy_status.updates,
                        cond = lazy_status.has_updates,
                        color = { fg = "#ff9e64" },
                    },
                    { "encoding" },
                    { "filetype" },
                },
            },
            globalstatus = true
        })
    end,
}
