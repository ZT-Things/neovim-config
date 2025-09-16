-- in your plugins.lua or wherever you call lazy.setup({})
return {
    {
        "andweeb/presence.nvim",
        event = "VeryLazy", -- optional: load lazily
        config = function()
            require("presence").setup({
                auto_update         = true,
                neovim_image_text   = "The Superior Text Editor",
                main_image          = "neovim",
                enable_line_number  = false,
                buttons             = true,
                show_time           = true,

                editing_text = function(filename)
                    if PRIVATE_MODE then
                        return "Editing <redacted>"
                    else
                        return "Editing " .. (filename or "Unknown File")
                    end
                end,

                file_explorer_text = function(name)
                    if PRIVATE_MODE then
                        return "Browsing <redacted>"
                    else
                        return "Browsing " .. (name or "Unknown")
                    end
                end,

                git_commit_text = function()
                    return PRIVATE_MODE and "Committing Changes" or "Committing changes"
                end,

                plugin_manager_text = function(name)
                    return PRIVATE_MODE and "Managing Plugins" or "Managing " .. (name or "Plugins")
                end,

                reading_text = function(name)
                    return PRIVATE_MODE and "Reading Docs" or "Reading " .. (name or "Unknown")
                end,

                workspace_text = function(project_name)
                    return PRIVATE_MODE and "In Private Workspace" or "Working on " .. (project_name or "Unknown")
                end,

                line_number_text = function(line, count)
                    return PRIVATE_MODE and "Line <redacted>" or ("Line " .. line .. " out of " .. count)
                end,
            })
        end,
    },
}

