return {
  "neovim/nvim-lspconfig",
  -- This 'config = false' stops lazy from trying to call lspconfig.setup()
  config = function()
    vim.lsp.config("clangd", {
      cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--header-insertion=iwyu",
      },
    })

    -- Your other servers (except JDTLS which is handled by nvim-java)
  end,
}
