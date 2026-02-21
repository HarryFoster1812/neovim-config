return {
  "nvim-java/nvim-java",
  ft = { "java" },
  dependencies = {
    "neovim/nvim-lspconfig",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
  },
  config = function()
    local cmp = require("cmp")

    -- nvim-cmp setup
    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" },
        { name = "luasnip" },
      }),
    })

    -- Setup nvim-java with LSP
    require("java").setup({
      lsp = {
        cmd = { vim.fn.stdpath("data") .. "/mason/packages/jdtls/bin/jdtls" },
        root_dir = require("lspconfig.util").root_pattern("pom.xml", "build.gradle", ".git"),
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        settings = {
          java = {
            signatureHelp = { enabled = true },
            contentProvider = { preferred = "fernflower" },
            completion = {
              favoriteStaticMembers = { "org.junit.Assert.*", "org.junit.jupiter.api.Assertions.*" },
            },
          },
        },
      },
    })

    -- Optional: format on save
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.java",
      callback = function()
        vim.lsp.buf.format({ async = false })
      end,
    })
  end,
}
