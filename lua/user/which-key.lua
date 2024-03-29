local kind = require('user.kind').icon_mapping
local plugin = require('user.plugins')

local wk = lvim.builtin.which_key

vim.keymap.set("n", "<C-e>", function() plugin.harpoon_toggle() end,
  { desc = "Open harpoon window" })


wk.mappings["a"] = { ":lua require('harpoon'):list():append()<cr>", "Harpoon Add" }
wk.mappings["m"] = {
  name = ' ' .. kind.todo_comments.PERF .. " Harpoon",
  m = wk.mappings["a"],
  a = { ":lua require('harpoon'):list():select(1)<cr>", "Goto mark 1" },
  s = { ":lua require('harpoon'):list():select(2)<cr>", "Goto mark 2" },
  d = { ":lua require('harpoon'):list():select(3)<cr>", "Goto mark 3" },
  f = { ":lua require('harpoon'):list():select(4)<cr>", "Goto mark 4" },
  g = { ":lua require('harpoon'):list():select(5)<cr>", "Goto mark 5" },
  q = { ":lua require('harpoon'):list():select(6)<cr>", "Goto mark 6" },
  w = { ":lua require('harpoon'):list():select(7)<cr>", "Goto mark 7" },
  e = { ":lua require('harpoon'):list():select(8)<cr>", "Goto mark 8" },
  r = { ":lua require('harpoon'):list():select(9)<cr>", "Goto mark 9" },
  n = { ":lua require('harpoon'):list():next()<cr>", "Next file" },
  p = { ":lua require('harpoon'):list():prev()<cr>", "Prev file" },
}



wk.mappings["S"] = {
  name = " persistence.nvim",
  s = { "<cmd>lua require('persistence').load()<cr>", kind.icons.clock .. " Reload last session for dir" },
  l = { "<cmd>lua require('persistence').load({ last = true })<cr>", kind.icons.clock .. " Restore last session" },
  Q = { "<cmd>lua require('persistence').stop()<cr>", kind.icons.exit .. " Quit without saving session" },
}

wk.mappings["l"]["t"] = { ":LvimToggleFormatOnSave<cr>", kind.symbols_outline.File .. " Toggle format-on-save" }
wk.mappings["l"]["R"] = { ":LspRestart<cr>", kind.icons.exit .. " Restart" }

wk.mappings["s"]["w"] = {
  "<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.expand('<cword>') })<cr>",
  ' ' .. kind.cmp_kind.EnumMember .. " Search Word Under Cursor"
}

wk.mappings["d"] = {
  name = ' ' .. kind.icons.test .. " debugger",
  m = { "<cmd>lua require('neotest').run.run()<cr>", "Test Method" },
  M = { "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", "Test Method DAP" },
  f = { "<cmd>lua require('neotest').run.run({vim.fn.expand('%')})<cr>", "Test Class" },
  F = { "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>", "Test Class DAP" },
  S = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Test Summary" },
  t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
  b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
  c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
  C = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run To Cursor" },
  d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
  g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
  i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
  o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
  u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
  p = { "<cmd>lua require'dap'.pause()<cr>", "Pause" },
  r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
  s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
  q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
  U = { "<cmd>lua require'dapui'.toggle({reset = true})<cr>", "Toggle UI" },

}



wk.mappings["W"] = {
  name = ' ' .. kind.icons.screen .. " Window Ctrl",
  h = { '<C-w>|', 'Maximize window horizontally (|)' },
  v = { '<C-w>_', 'Maximize window vertically (_)' },
  ['='] = { '<C-w>=', 'Resize windows equally' },
  s = { ":lua require('telescope-tabs').list_tabs()<cr>", 'Search Tabs' },
}

wk.mappings["G"] = {
  name = ' ' .. kind.icons.hint .. " Github Copilot",
  t = { ":lua require('copilot.suggestion').toggle_auto_trigger()<cr>", "Toggle Auto Trigger" },
}

wk.mappings['X'] = { ":xa<cr>", "Save All and Quit", }
wk.mappings['x'] = { ":w<bar>:bp<bar>sp<bar>bn<bar>bd<cr>", "Close Buffer", }

wk.mappings["t"] = {
  name = ' Telescope',
  p = { ':Telescope projects<cr>', 'Projects' }, -- requires telescope-project.nvim plugin
  r = { ':Telescope resume<cr>', 'Resume' },
}



wk.mappings["C"] = {
  name = "Python",
  c = { "<cmd>lua require('swenv.api').pick_venv()<cr>", "Choose Env" },
  d = { "<cmd>set background=dark <cr>", "Dark Mode" },
  l = { "<cmd>set background=light <cr>", "Light Mode" }
}
