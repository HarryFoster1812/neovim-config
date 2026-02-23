return {
  "neovim/nvim-lspconfig",
  -- This 'config = false' stops lazy from trying to call lspconfig.setup()
  config = function()
    local lspconfig = require("lspconfig")
    
    -- Setup clangd for C++
    lspconfig.clangd.setup({
      cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--header-insertion=iwyu",
      },
    })

    -- Your other servers (except JDTLS which is handled by nvim-java)
    lspconfig.lua_ls.setup({})
  end,
}
