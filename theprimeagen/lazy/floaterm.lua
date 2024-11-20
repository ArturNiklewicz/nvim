return {
    "voldikss/vim-floaterm",
    config = function()
        -- Floaterm Settings
        vim.g.floaterm_width = 0.75 -- 75% width, leaves 25% space on left and right
        vim.g.floaterm_height = 0.9 -- Full height of the window
        vim.g.floaterm_wintype = "float" -- Use a floating window
        vim.g.floaterm_position = "center" -- Center the terminal
        vim.g.floaterm_autoclose = 0 -- Persist terminal state on close
        vim.g.floaterm_title = "Terminal: $1" -- Title for the terminal

        -- Highlighting (optional for transparency)
        vim.cmd("highlight Floaterm guibg=#1e1e2e guifg=#ffffff")

        -- Keybinding for Toggle
        vim.keymap.set("n", "<C-t>", ":FloatermToggle<CR>", {
            noremap = true,
            silent = true,
            desc = "Toggle Floating Terminal",
        })
    end,
}

