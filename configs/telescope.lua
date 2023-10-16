local actions = require "telescope.actions"

local M = {}

M.opts = {
  defaults = {
    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },
    file_ignore_patterns = { ".git/", "node_modules" },
    mappings = {
      i = {
        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
    },
  },
  pickers = {
    colorscheme = {
      enable_preview = true,
    },
  },
  load_extensions = { "bibtex" },
  extensions = {
    bibtex = {
      depth = 1,
      -- Depth for the *.bib file
      custom_formats = {},
      -- Custom format for citation label
      format = "",
      -- Format to use for citation label.
      -- Try to match the filetype by default, or use 'plain'
      global_files = { "~/Sync/3. Misc/Citations/references.bib" },
      -- Path to global bibliographies (placed outside of the project)
      search_keys = { "author", "year", "title" },
      -- Define the search keys to use in the picker
      citation_format = "{{author}} ({{year}}), {{title}}.",
      -- Template for the formatted citation
      citation_trim_firstname = true,
      -- Only use initials for the authors first name
      citation_max_auth = 2,
      -- Max number of authors to write in the formatted citation
      -- following authors will be replaced by "et al."
      -- context = true,
      -- Context awareness disabled by default
      context_fallback = true,
      -- Fallback to global/directory .bib files if context not found
      -- This setting has no effect if context = false
      wrap = false,
      -- Wrapping in the preview window is disabled by default
    },
  },
}

return M
