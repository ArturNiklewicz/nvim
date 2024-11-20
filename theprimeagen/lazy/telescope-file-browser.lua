return {
  "nvim-telescope/telescope-file-browser.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local fb_actions = require("telescope._extensions.file_browser.actions")

    telescope.setup({
      extensions = {
        file_browser = {
          -- Path to open in file_browser by default
          hijack_netrw = true,
          mappings = {
            ["i"] = {
              ["<C-n>"] = fb_actions.create, -- Create file or folder
              ["<C-d>"] = fb_actions.remove, -- Delete selected file
              ["<C-r>"] = fb_actions.rename, -- Rename file
            },
            ["n"] = {
              ["n"] = fb_actions.create, -- Normal mode: Create file or folder
              ["d"] = fb_actions.remove, -- Normal mode: Delete selected file
              ["r"] = fb_actions.rename, -- Normal mode: Rename file
            },
          },
        },
      },
    })

    -- Load the file browser extension
    telescope.load_extension("file_browser")

    -- Keymap to launch file browser
    vim.api.nvim_set_keymap(
      "n",
      "<leader>fb",
      ":Telescope file_browser path=%:p:h<CR>",
      { noremap = true, silent = true }
    )

    -- Additional keymap for opening in the root directory
    vim.api.nvim_set_keymap(
      "n",
      "<leader>fr",
      ":Telescope file_browser<CR>",
      { noremap = true, silent = true }
    )
  end,
}

