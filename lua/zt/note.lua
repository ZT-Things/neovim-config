local function sync_vault()
  local VAULT = os.getenv("HOME") .. "/obsidian-vault"
  local timestamp = os.date("%Y-%m-%d %H:%M:%S")

  local cmd = string.format(
    "cd %s && git add -A && " ..
    "git diff --cached --quiet || " ..
    "(git commit -m 'vault backup: %s' && git push origin main)",
    VAULT,
    timestamp
  )

  print("Syncing vault...")
  vim.fn.jobstart({ "sh", "-c", cmd }, {
    on_exit = function(_, code)
      if code == 0 then
        print("Vault synced.")
      else
        print("Sync failed.")
      end
    end,
  })
end

vim.keymap.set("n", "<leader>l", function()
  local VAULT = os.getenv("HOME") .. "/obsidian-vault"

  local today = os.date("%Y-%m-%d")
  local year = os.date("%Y")
  local month = os.date("%B")

  local today_path = string.format(
    "%s/00-daily/%s/%s/%s.md",
    VAULT,
    year,
    month,
    today
  )

  local actions = {
    {
        name = "Sync Vault",
        action = function()
            sync_vault()
        end,
    },
    {
      name = "Daily (today)",
      action = function()
        if vim.fn.filereadable(today_path) == 1 then
          vim.cmd("edit " .. today_path)
        else
          print("Today's note does not exist.")
        end
      end,
    },
    {
      name = "Open Notes Folder",
      action = function()
        vim.cmd("edit " .. VAULT .. "/01-notes")
      end,
    },
    {
      name = "Open Projects Folder",
      action = function()
        vim.cmd("edit " .. VAULT .. "/02-projects")
      end,
    },
  }

  require("telescope.pickers")
    .new({}, {
      prompt_title = "Vault",
      finder = require("telescope.finders").new_table({
        results = actions,
        entry_maker = function(entry)
          return {
            value = entry,
            display = entry.name,
            ordinal = entry.name,
          }
        end,
      }),
      sorter = require("telescope.config").values.generic_sorter({}),
      attach_mappings = function(prompt_bufnr, map)
        local state = require("telescope.actions.state")
        local actions_close = require("telescope.actions")

        map("i", "<CR>", function()
          local selection = state.get_selected_entry()
          actions_close.close(prompt_bufnr)
          selection.value.action()
        end)

        return true
      end,
    })
    :find()
end)
