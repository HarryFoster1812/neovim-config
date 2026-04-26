return {
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
  dependencies = {
    "rafamadriz/friendly-snippets"
  },
	build = "make install_jsregexp",
	config = function()
    require("luasnip.loaders.from_vscode").lazy_load()
		vim.cmd[[
		" Use Tab to expand and jump through snippets
		imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
		smap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'

		" Use Shift-Tab to jump backwards through snippets
		imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
		smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
		]]
	end
}
