return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of imporing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

  -- { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.completion.copilot-lua-cmp" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.toml" },
  { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.editing-support.nvim-ts-rainbow" },
  {
    "simrat39/rust-tools.nvim",
    opts = {
      tools = {
        hover_actions = {
          auto_focus = true,
        },
      },
      server = {
        on_attach = function(client, bufnr)
          -- override here. call lsp on attach and then add own custom logic.
          require("astronvim.utils.lsp").on_attach(client, bufnr)
          local rt = require "rust-tools"

          local utils = require "astronvim.utils"

          utils.set_mappings({
            n = {
              ["<leader>r"] = { name = " Rust Tools" },
              ["<leader>rr"] = { rt.hover_actions.hover_actions, desc = "Rust Hover Actions" },
              ["<leader>ra"] = { rt.code_action_group.code_action_group, desc = "Rust Code Actions" },
            },
          }, { buffer = bufnr })
        end,
      },
    },
  },
}
