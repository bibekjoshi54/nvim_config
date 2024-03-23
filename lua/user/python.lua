print("Configuring the python specific changes")


local function setup_linter()
  -- Skipping this as mypy is giving me lot of issues in the virtual env
  local linters = require "lvim.lsp.null-ls.linters"
  linters.setup {
    { name = "mypy" }
  }
end

local function setup_diagnostic()
  local diagnostic = require "lvim.lsp.null-ls.linters"
  diagnostic.setup {
    { name = "flake8", filetypes = { "python" } },
  }
end

local function reload_python_linter()
  local null_ls = require('null-ls')
  null_ls.deregister({ name = "mypy" })
  setup_linter()
end

local function setup_dap()
  lvim.builtin.dap.active = true
  local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")
  pcall(function()
    require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python")
  end)

  require("neotest").setup({
    adapters = {
      require("neotest-python")({
        dap = {
          justMyCode = false,
          console = "integratedTerminal",
        },
        args = { "--log-level", "DEBUG", "--quiet" },
        runner = "pytest",
      })
    }
  })
end

require('swenv').setup(
  {
    post_set_venv = function()
      vim.cmd("LspRestart")
      -- reload_python_linter()
      setup_dap()
    end,

    get_venvs = function(venvs_path)
      local project_root = string.gsub(vim.fn.system("git rev-parse --show-toplevel"), "\n", "")
      -- local virtual_env = vim.fn.system("poetry env info --path")
      local path = project_root .. "/" .. '.virtualenvs'
      local collection = require('swenv.api').get_venvs(path)
      return collection
    end,
    venvs_path = "~/venvs"
  }
)


vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })


local pyright_opts = {
  single_file_support = true,
  settings = {
    pyright = {
      disableLanguageServices = false,
      disableOrganizeImports = false
    },
    python = {
      analysis = {
        autoImportCompletions = true,
        autoSearchPaths = true,
        diagnosticMode = "workspace", -- openFilesOnly, workspace
        typeCheckingMode = "strict",  -- off, basic, strict
        useLibraryCodeForTypes = true
      }
    }
  },
}

require("lvim.lsp.manager").setup("pyright", pyright_opts)



local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { name = "black" },
  { name = "isort" },
}


vim.api.nvim_create_user_command("NullLsToggle", function()
  -- you can also create commands to disable or enable sources
  require("null-ls").toggle({})
end, {})
