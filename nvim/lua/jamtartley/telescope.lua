local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require "telescope.actions"

telescope.setup {
  defaults = {
    prompt_prefix = "  ",
    selection_caret = "  ",
    path_display = { "smart" },
    mappings = {
      i = {
        ["<C-h>"] = actions.cycle_history_prev,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-l>"] = actions.cycle_history_next,

        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,

        ["<C-c>"] = actions.close,
        ["<esc>"] = actions.close,

        ["<CR>"] = actions.select_default,
      },
    },
  },
  pickers = {
    find_files = {
      previewer = false,
      theme = "dropdown",
    },
    git_files = {
      previewer = false,
      show_untracked = true,
      theme = "dropdown",
    },
    live_grep = {
      theme = "dropdown"
    }
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {}
    }
  },
}

telescope.load_extension("ui-select")
