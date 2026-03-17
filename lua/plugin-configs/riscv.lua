return {
  "HarryFoster1812/riscv-bennett-asm-vim",
  ft = { "riscv_asm", "s", "S", 'inc'},
  init = function()
    -- This fixes the E121 error by defining the variable before the ftplugin runs
    vim.g.riscv_asm_all_enable = 1
    vim.g.riscv_asm_custom_isa = { { name = "Xbennett", ver = 1.0 } }
  end,
  config = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "riscv_asm", "s", "S", "inc" },
      callback = function()
        vim.cmd("runtime! syntax/riscv-isas/riscv_asm_xbennett.vim")
      end,
    })
  end,
}
