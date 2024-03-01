return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, opts)
    -- opts.filesystem.hijack_netrw_behavior = "open_default"
    -- opts.filesystem.filtered_items = {
    -- visible = false,
    -- hide_dotfiles = true,
    -- hide_gitignored = false,
    -- hide_by_patterns = {
    --   "target",
    -- },
    -- }
    opts.window.position = "left"
  end,
}
