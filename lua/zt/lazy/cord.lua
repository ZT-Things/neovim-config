PRIVATE_MODE = true
return {
    "vyfor/cord.nvim",
    config = function()
        require("cord").setup({
            enabled = true,
            log_level = vim.log.levels.OFF,

            editor = {
                client = 'neovim',
                tooltip = 'The Superior Text Editor',
                icon = nil,
            },

            display = {
                theme = 'default',
                flavor = 'dark',
                swap_fields = false,
                swap_icons = true,
            },

            timestamp = {
                enabled = true,
                reset_on_idle = false,
                reset_on_change = false,
                shared = false,
            },

            idle = {
                enabled = false,
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
                    return PRIVATE_MODE and "In Private Workspace" or ("In " .. (opts.workspace or ""))
                end,

                viewing = function(opts)
                    return PRIVATE_MODE and "Viewing <redacted>" or ("Viewing " .. (opts.filename or ""))
                end,

                editing = function(opts)
                    return PRIVATE_MODE and "Editing <redacted>" or ("Editing " .. (opts.filename or ""))
                end,

                file_browser = function(opts)
                    return PRIVATE_MODE and "Browsing <redacted>" or ("Browsing files in " .. (opts.name or ""))
                end,

                plugin_manager = function(opts)
                    return PRIVATE_MODE and "Managing Plugins" or ("Managing plugins in " .. (opts.name or ""))
                end,

                lsp = function(opts)
                    return PRIVATE_MODE and "Configuring LSP" or ("Configuring LSP in " .. (opts.name or ""))
                end,

                docs = function(opts)
                    return PRIVATE_MODE and "Reading Docs" or ("Reading " .. (opts.name or ""))
                end,

                vcs = function(opts)
                    return PRIVATE_MODE and "Committing Changes" or ("Committing changes in " .. (opts.name or ""))
                end,

                notes = function(opts)
                    return PRIVATE_MODE and "Taking Notes" or ("Taking notes in " .. (opts.name or ""))
                end,

                debug = function(opts)
                    return PRIVATE_MODE and "Debugging" or ("Debugging in " .. (opts.name or ""))
                end,

                test = function(opts)
                    return PRIVATE_MODE and "Testing Code" or ("Testing in " .. (opts.name or ""))
                end,

                diagnostics = function(opts)
                    return PRIVATE_MODE and "Fixing Problems" or ("Fixing problems in " .. (opts.name or ""))
                end,

                games = function(opts)
                    return PRIVATE_MODE and "Playing" or ("Playing " .. (opts.name or ""))
                end,

                terminal = function(opts)
                    return PRIVATE_MODE and "Running Commands" or ("Running commands in " .. (opts.name or ""))
                end,

                dashboard = 'Home',
            },

            buttons = nil,
            assets = nil,
            variables = nil,
            hooks = {
                ready = nil,
                shutdown = nil,
                pre_activity =  nil,
                post_activity = nil,
                idle_enter = nil,
                idle_leave = nil,
                workspace_change = nil,
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
