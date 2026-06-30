local M = {}

-- separate state (IMPORTANT: no type ambiguity anymore)
local love_job = nil -- jobstart ("love .")
local love_term = nil -- ToggleTerm ("lovec .")

local function get_root() return vim.fs.root(0, { "main.lua", "conf.lua" }) end

-- =========================================
-- SILENT RUN (no visible terminal)
-- =========================================
function M.run()
  local root = get_root()

  if not root then return vim.notify("No LÖVE root", vim.log.levels.ERROR) end

  if love_job or love_term then return vim.notify "LÖVE already running" end

  love_job = vim.fn.jobstart("love .", {
    cwd = root,
    detach = true,
  })

  vim.notify "LÖVE started (silent)"
end

-- =========================================
-- TERMINAL RUN (logs via ToggleTerm)
-- =========================================
function M.runWithLog()
  local root = get_root()

  if not root then return vim.notify("No LÖVE root", vim.log.levels.ERROR) end

  if love_job or love_term then return vim.notify "LÖVE already running" end

  local Terminal = require("toggleterm.terminal").Terminal

  love_term = Terminal:new {
    cmd = "lovec .",
    dir = root,
    direction = "horizontal",
    size = 12,
    close_on_exit = false,
    hidden = true,
  }

  love_term:toggle()

  vim.notify "LÖVE started (console)"
end

-- =========================================
-- STOP EVERYTHING (SAFE CLEANUP)
-- =========================================
function M.stop()
  -- stop silent job
  if love_job then
    vim.fn.jobstop(love_job)
    love_job = nil
  end

  -- stop toggleterm instance
  if love_term then
    love_term:shutdown()
    love_term = nil
  end

  -- force kill leftover processes (Windows safety net)
  vim.fn.system "taskkill /IM love.exe /F >nul 2>&1"

  vim.notify "LÖVE stopped"
end

-- =========================================
-- KEYMAPS
-- =========================================
vim.keymap.set("n", "<leader>vr", M.run, { desc = "Run LÖVE (silent)" })
vim.keymap.set("n", "<leader>vc", M.runWithLog, { desc = "Run LÖVE (console)" })
vim.keymap.set("n", "<leader>ve", M.stop, { desc = "Stop LÖVE" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "move down in buffer with cursor centered" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "move up in buffer with cursor centered" })
vim.keymap.set("n", "<leader>re", "<cmd>restart<cr>", { desc = "Restart Neovim(:restart)" })
vim.keymap.set("x", "p", [["_dP]], { desc = "Paste over selection without losing yanked text" })
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without yanking" })
vim.keymap.set("n", "<C-c", ":nohl<CR>", { desc = "Clear search highlighting", silent = true })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "moves lines down in visual selection" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "moves lines up in visual selection" })
return M
