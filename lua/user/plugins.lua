lvim.plugins = {
  { "christoomey/vim-tmux-navigator" },
  { "tpope/vim-surround" },
  { "tpope/vim-repeat" },
  -- Color Scheme
  { "tanvirtin/monokai.nvim" },
  { "ellisonleao/gruvbox.nvim" },
  -- python debugging
  { "mfussenegger/nvim-dap-python" },
  { "nvim-neotest/neotest" },
  { "nvim-neotest/neotest-python" },
  { "nvim-neotest/nvim-nio" },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup(
        {
          panel = {
            enabled = true,
            auto_refresh = false,
            keymap = {
              jump_prev = "[[",
              jump_next = "]]",
              accept = "<CR>",
              refresh = "gr",
              open = "<M-CR>"
            },
            layout = {
              position = "bottom", -- | top | left | right
              ratio = 0.4
            },
          },
          suggestion = {
            enabled = true,
            auto_trigger = true,
            debounce = 50,
            keymap = {
              accept = "<c-l>",
              next = "<c-j>",
              prev = "<c-k>",
              dismiss = "<c-h>",
              accept_word = false,
              accept_line = false,

            },
          },
          filetypes = {
            yaml = false,
            markdown = false,
            help = false,
            gitcommit = false,
            gitrebase = false,
            hgcommit = false,
            svn = false,
            cvs = false,
            ["."] = false,
          },
          copilot_node_command = 'node', -- Node.js version must be > 18.x
          server_opts_overrides = {},
        }

      )
    end,
  },
  --[[
  {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function()
      require("copilot_cmp").setup()
    end,
  },
  ]]


  -- Todo Highligher
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end
  },
  -- Window Scheme
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    config = function()
      require("persistence").setup({
        dir = vim.fn.expand(vim.fn.stdpath "state" .. "/sessions/"),
        options = { "buffers", "curdir", "tabpages", "winsize" }
      })
    end
  },

  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" }
  },

  {
    'nvim-telescope/telescope-frecency.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim', 'kkharji/sqlite.lua' },
  },

  -- Python venev switcher
  { "ChristianChiarulli/swenv.nvim" },
  { "stevearc/dressing.nvim" },
}

print("Finished loading the custom plugin")

lvim.builtin.telescope.on_config_done = function(telescope)
  pcall(telescope.load_extension, "frecency")
end


local harpoon = require('harpoon')
harpoon:setup({})
local conf = require("telescope.config").values
local M = {}

M.harpoon_toggle = function()
  local harpoon_files = harpoon:list()
  local make_finder = function()
    local paths = {}
    for _, item in ipairs(harpoon_files.items) do
      table.insert(paths, item.value)
    end

    return require("telescope.finders").new_table({
      results = paths,
    })
  end

  require("telescope.pickers")
      .new({}, {
        prompt_title = "Harpoon",
        finder = make_finder(),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
        attach_mappings = function(prompt_buffer_number, map)
          map("i", "<C-d>", function()
            local state = require("telescope.actions.state")
            local selected_entry = state.get_selected_entry()
            local current_picker = state.get_current_picker(prompt_buffer_number)

            harpoon:list():removeAt(selected_entry.index)
            current_picker:refresh(make_finder())
            -- current_picker:set_selection(selected_entry.index)
          end)

          return true
        end,
      })
      :find()
end

return M
