return {
    "folke/noice.nvim", -- Plugin name
    dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
    config = function()
        require("noice").setup({
            cmdline = {
                view = "cmdline_popup",
            },
            popupmenu = {
                enabled = true,
                backend = "nui",
            },
        })
    end,
}

