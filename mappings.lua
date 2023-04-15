-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    ["<leader>r"] = { desc = "Rust Tools" },
    ["<leader>rm"] = { function() require("rust-tools").expand_macro.expand_macro() end, desc = "Expand Macro" },
    ["<leader>rr"] = { function() require("rust-tools").hover_actions.hover_actions() end, desc = "Rust Hover Actions" },
    ["<leader>rs"] = { function() require("rust-tools").ssr.ssr() end, desc = "Structural Search Replace" },
    ["<leader>ra"] = {
      function() require("rust-tools").code_action_group.code_action_group() end,
      desc = "Rust Code Actions",
    },
    ["<leader>rb"] = { function() require("rust-tools").runnables.runnables() end, desc = "Rust Runnables" },
    ["<leader>rd"] = { function() require("rust-tools").debuggables.debuggables() end, desc = "Rust Runnables" },
    ["<leader>rj"] = { function() require("rust-tools").join_lines.join_lines() end, desc = "Join Lines" },
    ["<leader>rc"] = {
      function() require("rust-tools").open_cargo_toml.open_cargo_toml() end,
      desc = "Open Cargo.toml",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
  },
  i = {
    ["<c-s>"] = { "<esc>:w<cr>", desc = "Save File" },
  },
  t = {
    -- setting a mapping to false will disable it
    ["<esc>"] = false,
  },
}
