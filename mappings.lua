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
    ["<leader>m"] = { desc = "󱁤 Compiler" },
    ["<leader>mt"] = { "<cmd>TexlabBuild<cr>", desc = "LaTeX" },
    ["<leader>lc"] = { desc = "Calls" },
    ["<leader>lci"] = { function() vim.lsp.buf.incoming_calls() end, desc = "Incoming Calls" },
    ["<leader>lco"] = { function() vim.lsp.buf.outgoing_calls() end, desc = "Outgoing Calls" },
    ["<leader>lcc"] = { function() require("litee.calltree").close_calltree() end, desc = "Close Calltree" },
    ["<leader>lcp"] = { function() require("litee.calltree").popout_to() end, desc = "Popout Calltree" },
    ["<leader>r"] = { name = " Rust Tools" },
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
    ["<leader>rC"] = {
      function() require("rust-tools").open_cargo_toml.open_cargo_toml() end,
      desc = "Open Cargo.toml",
    },
    ["<leader>rc"] = { name = "Crates" },
    ["<leader>rcr"] = { function() require("crates").reload() end, desc = "Reload Crates" },
    ["<leader>rcf"] = { function() require("crates").show_features_popup() end, desc = "Show Features" },
    ["<leader>rcv"] = { function() require("crates").show_versions_popup() end, desc = "Show Versions" },
    ["<leader>rcd"] = { function() require("crates").show_dependencies_popup() end, desc = "Show Dependencies" },
    ["<leader>rcu"] = { function() require("crates").update() end, desc = "Update Crate" },
    ["<leader>rca"] = { function() require("crates").update_all_crates() end, desc = "Update All Crates" },
    ["<leader>rcU"] = { function() require("crates").upgrade_crate() end, desc = "Upgrade Crate" },
    ["<leader>rcA"] = { function() require("crates").upgrade_all_crates() end, desc = "Upgrade All Crates" },
    ["<leader>rcH"] = { function() require("crates").open_homepage() end, desc = "Open Homepage" },
    ["<leader>rcR"] = { function() require("crates").open_repository() end, desc = "Open Repository" },
    ["<leader>rcD"] = { function() require("crates").open_documentation() end, desc = "Open Documentation" },
    ["<leader>rcC"] = { function() require("crates").open_crates_io() end, desc = "Open crates.io" },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    ["<leader>gB"] = { "<cmd>ToggleBlameLine<CR>", desc = "Blame" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    ["<leader>gd"] = { "<cmd>DiffviewOpen<cr>", desc = "Git Diff" },
    ["<leader>gD"] = { "<cmd>DiffviewClose<cr>", desc = "Git Diff Close" },
    ["<leader>gR"] = { "<cmd>DiffviewRefresh<cr>", desc = "Git Diff Refresh" },
    ["<leader>gF"] = { "<cmd>DiffviewToggleFiles<cr>", desc = "Git Diff Toggle Files" },
    ["<leader>gC"] = { "<cmd>DiffviewToggleCache<cr>", desc = "Git Diff Toggle Cache" },
    ["<leader>gS"] = { "<cmd>DiffviewToggleSigns<cr>", desc = "Git Diff Toggle Signs" },
    ["<leader>gT"] = { "<cmd>DiffviewToggle<cr>", desc = "Git Diff Toggle" },
  },
  i = {
    ["<c-s>"] = { "<esc>:w<cr>", desc = "Save File" },
  },
  t = {
    -- setting a mapping to false will disable it
    ["<esc>"] = false,
  },
}
