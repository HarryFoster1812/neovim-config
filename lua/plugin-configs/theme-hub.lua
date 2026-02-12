return {
    lazy = false,
    "erl-koenig/theme-hub.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local themehub = require("theme-hub")

        -- Setup theme-hub
        themehub.setup({})

        -- Function to link Rust Treesitter groups to standard highlights
        local function link_rust_ts_groups()
            local links = {
                rustStructure   = "Type",
                rustIdentifier  = "Identifier",
                rustKeyword     = "Keyword",
                rustBoolean     = "Boolean",
                rustComment     = "Comment",
                rustFunction    = "Function",
                rustMutable     = "Keyword",
                rustConstant    = "Constant",
                rustEnum        = "Type",
                rustTrait       = "Type",
                rustMacro       = "Macro",
                rustLifetime    = "Type",
                rustModule      = "Namespace",
            }

            for group, link in pairs(links) do
                vim.cmd("highlight! link " .. group .. " " .. link)
            end
        end

        -- Load last used theme if it exists
        local last_theme_file = vim.fn.stdpath("data") .. "/theme-hub-last-theme"
        if vim.fn.filereadable(last_theme_file) == 1 then
            local last_theme = vim.fn.readfile(last_theme_file)[1]
            vim.cmd.colorscheme(last_theme)
        end

        -- Apply Rust Treesitter links after loading the theme
        link_rust_ts_groups()

        -- Save theme on change and reapply Rust links
        vim.api.nvim_create_autocmd("ColorScheme", {
            callback = function(args)
                -- Save selected theme
                vim.fn.writefile(
                    { args.match },
                    vim.fn.stdpath("data") .. "/theme-hub-last-theme"
                )
                -- Reapply Rust Treesitter links
                link_rust_ts_groups()
            end,
        })
    end,
}
