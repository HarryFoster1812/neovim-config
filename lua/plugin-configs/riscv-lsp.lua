return {
  "V-Stojkovic/riscv-lsp",

  config = function()
    local lsp = vim.lsp

    -- filetypes
    vim.filetype.add({
      extension = {
        s = "riscv_asm",
        S = "riscv_asm",
      },
    })

    -- plugin path
    local plugin_path = vim.fn.stdpath("data") .. "/lazy/riscv-lsp"
    local server_path = plugin_path .. "/out/server.js"

    -- ensure dependencies exist 
    if vim.fn.isdirectory(plugin_path .. "/node_modules") == 0 then
      vim.notify("Installing riscv-lsp dependencies...", vim.log.levels.WARN)
      vim.fn.system("cd " .. plugin_path .. " && npm install")
    end

    if vim.fn.isdirectory(plugin_path .. "/out") == 0 then
      vim.notify("Compiling source...", vim.log.levels.WARN)
      vim.fn.system("cd " .. plugin_path .. " && tsc -p tsconfig.json")
    end

    -- LSP config (0.11+)
    vim.lsp.config("riscv_lsp", {
      cmd = { "node",
              server_path
            },

      filetypes = { "riscv_asm" },

      root_markers = { ".git" },

      single_file_support = true,
    })

    lsp.enable("riscv_lsp")
  end,
}
