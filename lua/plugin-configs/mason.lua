return {
  "williamboman/mason.nvim",
  dependencies = { 
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  config = function()
    require("mason").setup()
    
    -- This ensures the LSPs are actually installed
    require("mason-tool-installer").setup({
      ensure_installed = { "jdtls", "google-java-format", "lua_ls" },
    })

    -- This automatically sets up any LSP you install via Mason
    require("mason-lspconfig").setup({
      handlers = {
        function(server_name)
          -- Skip jdtls and rust_analyzer because they are handled by 
          -- nvim-java and rustaceanvim specifically
          if server_name == "jdtls" or server_name == "rust_analyzer" then
            return
          end
          require("lspconfig")[server_name].setup({})
        end,
      },
    })
  end,
}
