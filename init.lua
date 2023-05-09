return {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin",     -- remote to use
    channel = "stable",    -- "stable" or "nightly"
    version = "latest",    -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "nightly",    -- branch name (NIGHTLY ONLY)
    commit = nil,          -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil,     -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false,  -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_quit = false,     -- automatically quit the current session after a successful update
    remotes = {            -- easily add new remotes to track
      --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
      --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
      --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    },
  },
  -- Set colorscheme to use
  colorscheme = "lunar",
  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  },
  lsp = {
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = true,     -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- "sumneko_lua",
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
    },
  },
  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = false },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
      },
    },
  },
  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    vim.cmd [[nnoremap <expr> <silent> 0 col('.') == match(getline('.'),'S')+1 ? '0' : '^']]
    -- map Alt-J/K to move lines up and down
    vim.cmd [[nnoremap <A-j> :m .+1<CR>==]]
    vim.cmd [[nnoremap <A-k> :m .-2<CR>==]]
    vim.cmd [[inoremap <A-j> <Esc>:m .+1<CR>==gi]]
    vim.cmd [[inoremap <A-k> <Esc>:m .-2<CR>==gi]]
    vim.cmd [[vnoremap <A-j> :m '>+1<CR>gv=gv]]
    vim.cmd [[vnoremap <A-k> :m '<-2<CR>gv=gv]]
    -- on macos Alt-J sends ∆ and Alt-K sends ˚
    vim.cmd [[nnoremap ∆ :m .+1<CR>==]]
    vim.cmd [[nnoremap ˚ :m .-2<CR>==]]
    vim.cmd [[inoremap ∆ <Esc>:m .+1<CR>==gi]]
    vim.cmd [[inoremap ˚ <Esc>:m .-2<CR>==gi]]
    vim.cmd [[vnoremap ∆ :m '>+1<CR>gv=gv]]
    vim.cmd [[vnoremap ˚ :m '<-2<CR>gv=gv]]
    -- configure the litee.nvim library
    require("litee.lib").setup {}
    -- configure litee-calltree.nvim
    require("litee.calltree").setup {}
    vim.o.guifont = "UbuntuMono Nerd Font:h14"
    if vim.g.neovide then
      -- Put anything you want to happen only in Neovide here
      vim.g.neovide_remember_window_size = true
      vim.g.neovide_cursor_vfx_mode = ""
    end
  end,
}
