return {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    -- dependencies = { "nvim-tree/nvim-web-devicons", },
    config = function()
        local dashboard = require("dashboard")

        local nvim_version = "v" .. vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch

        dashboard.setup(
            {
                theme = "hyper",
                -- theme = "doom",

                config = {
                    header = {
                        "",
                        "",
                        "███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
                        "████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
                        "██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
                        "██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
                        "██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
                        "╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
                        "",
                        nvim_version,
                        ""
                    },
                    -- hyper
                    shortcut = {
                        {
                            desc = "New File",
                            group = "@property",
                            action = "ene | startinsert",
                            key = "n"
                        },
                        {
                            desc = "Config",
                            group = "Label",
                            action = "edit $MYVIMRC",
                            key = "c"
                        },
                        {
                            desc = "Lazy",
                            group = "Number",
                            action = "Lazy",
                            key = "L"
                        },
                        {
                            desc = "Quit",
                            group = "DiagnosticHint",
                            action = "qa",
                            key = "q"
                        }
                    },
                    -- doom
                    -- center = {
                    --     -- {
                    --     --   icon = "  ",
                    --     --   desc = "Find File",
                    --     --   key = "f",
                    --     --   action = "Telescope find_files",
                    --     -- },

                    --     {
                    --         icon = "  ",
                    --         desc = "New File",
                    --         key = "n",
                    --         action = "ene | startinsert"
                    --     },
                    --     -- {
                    --     --   icon = "  ",
                    --     --   desc = "Find Text",
                    --     --   key = "g",
                    --     --   action = "Telescope live_grep",
                    --     -- },

                    --     -- {
                    --     --   icon = "  ",
                    --     --   desc = "Recent Files",
                    --     --   key = "r",
                    --     --   action = "Telescope oldfiles",
                    --     -- },

                    --     {
                    --         icon = "  ",
                    --         desc = "Config",
                    --         key = "c",
                    --         action = "edit ~/.config/nvim/init.lua"
                    --     },
                    --     {
                    --         icon = "󰒲  ",
                    --         desc = "Lazy",
                    --         key = "L",
                    --         action = "Lazy"
                    --     },
                    --     {
                    --         icon = "  ",
                    --         desc = "Quit",
                    --         key = "q",
                    --         action = "qa"
                    --     }
                    -- },
                    footer = {},
                    mru = { enable = true },
                    project = { enable = false },
                    week_header = { enable = false },
                },
            }
        )
    end
}

