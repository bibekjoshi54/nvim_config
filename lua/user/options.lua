if vim.g.neovide then
  vim.opt.guifont = "MonoLisa:h24"

  vim.g.neovide_transparency = 1
  vim.g.transparency = 0.8
  vim.g.neovide_scroll_animation_length = 0.3
  vim.g.neovide_refresh_rate = 60
  vim.g.neovide_confirm_quit = true
  vim.g.neovide_input_macos_alt_is_meta = false
end


vim.g.python3_host_prog = "~/.miniconda3/bin/python"

lvim.log.level = "warn"
lvim.format_on_save.enabled = true

lvim.builtin.treesitter.ensure_installed = {
  "json",
  "lua",
  "yaml",
  "toml"
}

lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
lvim.builtin.nvimtree.setup.filters.custom = { '.git', '.mypy', '.virtualenv', '.poetry_cache', '__pycache__',
  '.pytest_cache', '.idea', '.vscode', '.ruff_cache' }

lvim.builtin.treesitter.ignore_install = {}
lvim.builtin.treesitter.highlight.enabled = true

lvim.builtin.project.detection_methods = { "pattern" }
lvim.builtin.project.patterns = {
  ".git",
  "pyproject.toml",
  "poetry.toml",
  "Makefile",
  "requirements.txt",
}

vim.opt.shell = "/bin/zsh"

vim.o.linebreak = true
vim.o.wrap = false
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

lvim.builtin.telescope.defaults.path_display = {
  shorten = 4,
}
