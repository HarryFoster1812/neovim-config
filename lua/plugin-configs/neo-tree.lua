return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",

    init = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
    end,

    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },

    opts = {
      filesystem = {
        follow_current_file = {
          enabled = true,
        },

        filtered_items = {
          visible = true,
        },
      },
    },
  },
}
