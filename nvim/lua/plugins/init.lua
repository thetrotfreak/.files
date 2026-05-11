return {
    -- https://github.com/nvim-tree/nvim-tree.lua/wiki/Installation#lazy
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        -- dependencies = {
        --   "nvim-tree/nvim-web-devicons",
        -- },
        config = function()
        require("nvim-tree").setup { }
        end
    },

    -- https://github.com/nvim-lualine/lualine.nvim#lazynvim
    {
        "nvim-lualine/lualine.nvim",
        -- dependencies = {"nvim-tree/nvim-web-devicons"}
        opts = {
            options = {
                icons_enabled = false,
                theme = "auto",
                disabled_filetypes = {
                    statusline = { "NvimTree", "dashboard" },
                },
                section_separators = '',
                component_separators = '',
            },
            sections = {
                lualine_b = {'diagnostics'},
                lualine_x = {'encoding', {'fileformat', icons_enabled = false}, 'filetype'},
                lualine_y = {},
            },
        }
    },

    -- https://github.com/romgrk/barbar.nvim#using-lazynvim
    {'romgrk/barbar.nvim',
        dependencies = {
            -- 'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
            -- 'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
            },
        init = function() vim.g.barbar_auto_setup = false end,
        opts = {
            -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
            -- animation = true,
            -- insert_at_start = true,
            -- …etc.
            icons = {
                filetype = {
                    enabled = false,
                }
            }
        },
        version = '^1.0.0', -- optional: only update when a new 1.x version is released
    },

    -- lua/plugins/rose-pine.lua
    {
        "rose-pine/neovim",
        name = "rose-pine",
        -- config = function()
        --     vim.cmd("colorscheme rose-pine")
        -- end
    },

    {
        "rebelot/kanagawa.nvim",
        opts = {
            commentStyle = { italic = false },
            keywordStyle = { italic = false },
            statementStyle = { bold = false },
            dimInactive = false,
            compile = true,
        },
        init = function() vim.cmd("colorscheme kanagawa") end,
    },

    {
        "bluz71/vim-moonfly-colors",
        name = "moonfly",
        lazy = false,
        -- priority = 1000,
        -- init = function() vim.g.moonflyItalics = false vim.cmd("colorscheme moonfly") end,
    },
}

