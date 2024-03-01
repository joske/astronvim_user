-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map

    -- navigate buffer tabs with `H` and `L`
    L = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer",
    },
    H = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },

    -- mappings seen under group name "Buffer"
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    ["<leader>fs"] = {
      function() require("telescope").extensions.live_grep_args.live_grep_args() end,
      desc = "Live Grep Args",
    },
    ["<leader>m"] = { name = "󱁤 Compiler" },
    ["<leader>mt"] = { "<cmd>TexlabBuild<cr>", desc = "LaTeX" },
    ["<leader>mc"] = { name = "Cargo" },
    ["<leader>mcb"] = { "<cmd>terminal cargo build<cr>", desc = "Cargo Build" },
    ["<leader>mcr"] = { "<cmd>terminal cargo run<cr>", desc = "Cargo Run" },
    ["<leader>lc"] = { name = "Calls" },
    ["<leader>lci"] = { function() vim.lsp.buf.incoming_calls() end, desc = "Incoming Calls" },
    ["<leader>lco"] = { function() vim.lsp.buf.outgoing_calls() end, desc = "Outgoing Calls" },
    ["<leader>lcc"] = { function() require("litee.calltree").close_calltree() end, desc = "Close Calltree" },
    ["<leader>lcp"] = { function() require("litee.calltree").popout_to() end, desc = "Popout Calltree" },

    ["<leader>r"] = { name = " Rust Tools" },
    ["<leader>rm"] = { function() require("rust-tools").expand_macro.expand_macro() end, desc = "Expand Macro" },
    ["<leader>rr"] = { function() require("rust-tools").hover_actions.hover_actions() end, desc = "Rust Hover Actions" },
    ["<leader>rs"] = { function() require("rust-tools").ssr.ssr() end, desc = "Structural Search Replace" },
    ["<leader>rp"] = { function() require("rust-tools").parent_module.parent_module() end, desc = "Parent Module" },
    ["<leader>rg"] = { function() require("rust-tools").crate_graph.view_crate_graph() end, desc = "Crate Graph" },
    ["<leader>ra"] = {
      function() require("rust-tools").code_action_group.code_action_group() end,
      desc = "Rust Code Actions",
    },
    ["<leader>rb"] = { function() require("rust-tools").runnables.runnables() end, desc = "Rust Runnables" },
    ["<leader>rd"] = { function() require("rust-tools").debuggables.debuggables() end, desc = "Rust Debuggables" },
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

    -- Trouble
    ["<leader>x"] = { name = "Trouble" },
    ["<leader>xx"] = { function() require("trouble").toggle() end, desc = "Trouble" },
    ["<leader>xw"] = { function() require("trouble").toggle "workspace_diagnostics" end, desc = "Trouble Workspace" },
    ["<leader>xd"] = { function() require("trouble").toggle "document_diagnostics" end, desc = "Trouble Document" },
    ["<leader>xl"] = { function() require("trouble").toggle "loclist" end, desc = "Trouble Location List" },
    ["<leader>xq"] = { function() require("trouble").toggle "quickfix" end, desc = "Trouble Quickfix" },
    ["<leader>xr"] = { function() require("trouble").toggle "lsp_references" end, desc = "Trouble LSP References" },
    -- Git
    ["<leader>g"] = { name = "Git" },
    ["<leader>gs"] = { "<cmd>Git<cr>", desc = "Git Status" },
    ["<leader>gb"] = { "<cmd>Git blame<cr>", desc = "Git Blame" },
    ["<leader>gB"] = { "<cmd>ToggleBlameLine<CR>", desc = "Blame" },
    ["<leader>gd"] = { "<cmd>DiffviewOpen<cr>", desc = "Git Diff" },
    ["<leader>gD"] = { "<cmd>DiffviewClose<cr>", desc = "Git Diff Close" },
    ["<leader>gR"] = { "<cmd>DiffviewRefresh<cr>", desc = "Git Diff Refresh" },
    ["<leader>gf"] = { "<cmd>DiffviewFileHistory<cr>", desc = "Git Diff File Hystory" },
    ["<leader>gF"] = { "<cmd>DiffviewToggleFiles<cr>", desc = "Git Diff Toggle Files" },
    ["<leader>gC"] = { "<cmd>DiffviewToggleCache<cr>", desc = "Git Diff Toggle Cache" },
    ["<leader>gS"] = { "<cmd>DiffviewToggleSigns<cr>", desc = "Git Diff Toggle Signs" },
    ["<leader>gT"] = { "<cmd>DiffviewToggle<cr>", desc = "Git Diff Toggle" },

    -- Todo
    ["<leader>T"] = { name = "TODOs" },
    ["<leader>Tt"] = { "<cmd>TodoTelescope<cr>", desc = "Open TODOs in Telescope" },
    ["<leader>Tq"] = { "<cmd>TodoQuickFix<cr>", desc = "Open TODOs in QuickFix" },
    ["<leader>Tx"] = { "<cmd>TodoTrouble<cr>", desc = "Open TODOs in Trouble" },
  },
  i = {
    ["<c-s>"] = { "<esc>:w<cr>", desc = "Save File" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
