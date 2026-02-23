return {
  "henry-hsieh/riscv-asm-vim",
  ft = { "riscv_asm", "s", "S" }, -- Added "s" and "S" since your error triggered on a .s file
  init = function()
    -- This fixes the E121 error by defining the variable before the ftplugin runs
    vim.g.riscv_asm_all_enable = 1
  end,
}
