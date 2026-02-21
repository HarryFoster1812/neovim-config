-- 1. Load options first (so they are ready for plugins)
require("options")


-- 4. Load Plugins (this will now auto-import everything in plugin-configs)
require("plugins")

-- 2. Load keymaps
require("keymaps")

-- 3. Load LSP autocmds
require("lsp")

-- 5. Load colorscheme (optional, or let theme-hub handle it)
require("colorscheme")
