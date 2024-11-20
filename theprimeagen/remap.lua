
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<cr>")

vim.keymap.set("n", "<leader>vwm", function()
    require("vim-with-me").StartVimWithMe()
end)
vim.keymap.set("n", "<leader>svwm", function()
    require("vim-with-me").StopVimWithMe()
end)

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", "\"_d")

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set(
    "n",
    "<leader>ee",
    "oif err != nil {<CR>}<Esc>Oreturn err<Esc>"
)

vim.keymap.set(
    "n",
    "<leader>ea",
    "oassert.NoError(err, \"\")<Esc>F\";a"
)

vim.keymap.set(
    "n",
    "<leader>el",
    "oif err != nil {<CR>}<Esc>O.logger.Error(\"error\", \"error\", err)<Esc>F.;i"
)


vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>");
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

-- Rearrange panes
vim.keymap.set("n", "<Leader>wh", "<C-w>H", { noremap = true, silent = true }) -- Move current pane to the far left
vim.keymap.set("n", "<Leader>wl", "<C-w>L", { noremap = true, silent = true }) -- Move current pane to the far right
vim.keymap.set("n", "<Leader>wk", "<C-w>K", { noremap = true, silent = true }) -- Move current pane to the top
vim.keymap.set("n", "<Leader>wj", "<C-w>J", { noremap = true, silent = true }) -- Move current pane to the bottom


-- Custom function to switch panes, skipping no-neck-pain buffers
local function switch_pane_excluding_no_neck_pain()
    local cur_win = vim.api.nvim_get_current_win()
    local wins = vim.api.nvim_tabpage_list_wins(0) -- Get all windows in the current tab
    for _, win in ipairs(wins) do
        if win ~= cur_win then
            local buf = vim.api.nvim_win_get_buf(win)
            local ft = vim.api.nvim_buf_get_option(buf, "filetype")
            if ft ~= "no-neck-pain" then
                vim.api.nvim_set_current_win(win)
                return
            end
        end
    end
end

local function reverse_switch_pane_excluding_no_neck_pain()
    local cur_win = vim.api.nvim_get_current_win()
    local wins = vim.api.nvim_tabpage_list_wins(0) -- Get all windows in the current tab
    for i = #wins, 1, -1 do
        if wins[i] ~= cur_win then
            local buf = vim.api.nvim_win_get_buf(wins[i])
            local ft = vim.api.nvim_buf_get_option(buf, "filetype")
            if ft ~= "no-neck-pain" then
                vim.api.nvim_set_current_win(wins[i])
                return
            end
        end
    end
end

-- Keymap for Tab to switch panes excluding no-neck-pain
vim.keymap.set("n", "<Tab>", switch_pane_excluding_no_neck_pain, { noremap = true, silent = true })

-- Keymap for Shift+Tab to reverse switch panes excluding no-neck-pain
vim.keymap.set("n", "<S-Tab>", reverse_switch_pane_excluding_no_neck_pain, { noremap = true, silent = true })

