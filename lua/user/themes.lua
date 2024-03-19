print("Loading the colorscheme")
M = {}
local themes = {
  monokai = "monokai",
  lunar = "lunar"
}

print("Loading of colorschem completed !!")


function M.light_scheme()
  vim.o.background = "light"
  lvim.colorscheme = "gruvbox"
end

function M.dark_scheme()
  vim.o.background = "dark"
  lvim.colorscheme = "gruvbox"
end

M.dark_scheme()

return M
