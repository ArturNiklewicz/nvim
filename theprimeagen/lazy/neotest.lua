return {
    {
        "nvim-neotest/neotest",
        dependencies = {
	    "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            "marilari88/neotest-vitest",
            "nvim-neotest/neotest-plenary",
            "nvim-neotest/nvim-nio",
            "nvim-neotest/neotest-python",
        },
        config = function()
            local neotest = require("neotest")
            neotest.setup({
                adapters = {
                    require("neotest-python"),
                    require("neotest-vitest"),
                    require("neotest-plenary").setup({
                        -- this is my standard location for minimal vim rc
                        -- in all my projects
                        min_init = "./scripts/tests/minimal.vim",
                    }),
                }
            })

            vim.keymap.set("n", "<leader>tc", function()
                neotest.run.run()
            end)
            vim.keymap.set("n", "<leader>ts", function()
                neotest.summary.toggle()
            end)
            vim.keymap.set("n", "<leader>tl", function()
                neotest.run.run_last()
            end)
            vim.keymap.set("n", "<leader>to", function()
                neotest.output_panel.toggle({
                enter = true,
                auto_close = true,
            })
            end)
            vim.keymap.set("n", "<leader>tx", function ()
                neotest.run.stop()
            end)
        end,
    },
}

