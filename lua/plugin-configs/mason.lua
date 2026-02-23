return {
  "williamboman/mason.nvim",
  dependencies = {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  config = function()
    require("mason").setup()

    require("mason-tool-installer").setup({
      ensure_installed = { "jdtls", "clangd", "lua_ls", "google-java-format" },
    })

    require("mason-lspconfig").setup({
      handlers = {
        -- The "default" handler
        function(server_name)
          -- Skip servers handled by specialized plugins
          if server_name == "jdtls" or server_name == "rust_analyzer" then
            return
          end

          -- Use the NEW Neovim 0.11+ way if available, else fallback
          local ok, server_config = pcall(require, "lspconfig.configs." .. server_name)
          if ok then
            require("lspconfig")[server_name].setup({})
          else
            -- Fallback for custom or older server configs
            vim.lsp.start_client(require("lspconfig")[server_name])
          end
        end,
      },
    })
  end,
}
