local private_mode = true

return {
    "vyfor/cord.nvim",
    config = function()
        require("cord").setup({
            enabled = true,
            log_level = vim.log.levels.DEBUG,

            editor = {
                client = 'neovim',
                tooltip = 'The Superior Text Editor',
                icon = nil,
            },

            display = {
                theme = 'default',
                flavor = 'dark',
                view = 'full',
                swap_fields = false,
                swap_icons = false,
            },

            timestamp = {
                enabled = true,
                reset_on_idle = false,
                reset_on_change = false,
                shared = false,
            },

            idle = {
                enabled = true,
                timeout = 300000,
                show_status = true,
                ignore_focus = true,
                unidle_on_focus = true,
                smart_idle = true,
                details = 'Idling',
                state = nil,
                tooltip = '💤',
                icon = nil,
            },

            text = {
                default = nil,

                workspace = function(opts)
                    return private_mode and "In Private Workspace"
                        or ("In " .. (opts.workspace or "Unknown Workspace"))
                end,

                viewing = function(opts)
                    return private_mode and "Viewing <redacted>"
                        or ("Viewing " .. (opts.filename or "Unknown File"))
                end,

                editing = function(opts)
                    return private_mode and "Editing <redacted>"
                        or ("Editing " .. (opts.filename or "Unknown File"))
                end,

                file_browser = function(opts)
                    return private_mode and "Browsing <redacted>"
                        or ("Browsing files in " .. (opts.name or "Unknown"))
                end,

                plugin_manager = function(opts)
                    return private_mode and "Managing Plugins"
                        or ("Managing plugins in " .. (opts.name or "Unknown"))
                end,

                lsp = function(opts)
                    return private_mode and "Configuring LSP"
                        or ("Configuring LSP in " .. (opts.name or "Unknown"))
                end,

                docs = function(opts)
                    return private_mode and "Reading Docs"
                        or ("Reading " .. (opts.name or "Unknown Docs"))
                end,

                vcs = function(opts)
                    return private_mode and "Committing Changes"
                        or ("Committing changes in " .. (opts.name or "Unknown Repo"))
                end,

                notes = function(opts)
                    return private_mode and "Taking Notes"
                        or ("Taking notes in " .. (opts.name or "Unknown Notebook"))
                end,

                debug = function(opts)
                    return private_mode and "Debugging"
                        or ("Debugging in " .. (opts.name or "Unknown"))
                end,

                test = function(opts)
                    return private_mode and "Testing Code"
                        or ("Testing in " .. (opts.name or "Unknown"))
                end,

                diagnostics = function(opts)
                    return private_mode and "Fixing Problems"
                        or ("Fixing problems in " .. (opts.name or "Unknown"))
                end,

                games = function(opts)
                    return private_mode and "Playing"
                        or ("Playing " .. (opts.name or "a Game"))
                end,

                terminal = function(opts)
                    return private_mode and "Running Commands"
                        or ("Running commands in " .. (opts.name or "Terminal"))
                end,

                dashboard = "Home",
            },

            buttons = nil,
            -- Example:
            -- buttons = {
            --     {
            --         label = 'View Repository',
            --         url = function(opts) return opts.repo_url end,
            --     },
            -- },

            assets = nil,
            variables = nil,

            hooks = {
                ready = nil,
                shutdown = nil,
                pre_activity = nil,
                post_activity = nil,
                idle_enter = nil,
                idle_leave = nil,
                workspace_change = nil,
                buf_enter = nil,
            },

            plugins = nil,

            advanced = {
                plugin = {
                    autocmds = true,
                    cursor_update = 'on_hold',
                    match_in_mappings = true,
                },

                server = {
                    update = 'fetch',
                    pipe_path = nil,
                    executable_path = nil,
                    timeout = 300000,
                },

                discord = {
                    pipe_paths = { "/run/user/1000/discord-ipc-1" },
                    reconnect = {
                        enabled = false,
                        interval = 5000,
                        initial = true,
                    },
                },

                workspace = {
                    root_markers = { '.git', '.hg', '.svn' },
                    limit_to_cwd = false,
                },
            },
        })
    end,
}
