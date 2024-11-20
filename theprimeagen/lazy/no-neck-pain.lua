return {
    "shortcuts/no-neck-pain.nvim",
    version = "*",
    config = function()
        require("no-neck-pain").setup({
            buffers = {
                scratch = {
                    bo = {
                        filetype = "no-neck-pain",
                    },
                },
            },
            autocmds = {
            -- When `true`, enables the plugin when you start Neovim.
            -- If the main window is  a side tree (e.g. NvimTree) or a dashboard, the command is delayed until it finds a valid window.
            -- The command is cleaned once it has successfuly ran once.
            --- @type boolean
            enableOnVimEnter = true,
            -- When `true`, enables the plugin when you enter a new Tab.
            -- note: it does not trigger if you come back to an existing tab, to prevent unwanted interfer with user's decisions.
            --- @type boolean
            enableOnTabEnter = true,
            -- When `true`, reloads the plugin configuration after a colorscheme change.
            --- @type boolean
            reloadOnColorSchemeChange = true,
            },
            vim.api.nvim_create_autocmd("FileType", {
                pattern = "no-neck-pain",
                callback = function()
                    vim.opt_local.fillchars:append { eob = " " }
                    -- Set `buftype` to `nofile` to hide `[No Name]`
                    -- Reapply the lualine configuration with a purple theme (like rose-pine)
                    require("lualine").setup({
                        options = {
                            theme = "auto", -- Change this to any desired theme
                        },
                    })
                    ColorMyPencils()
                end,
            })
        })
    end
}
