local M = {}

local love_job = nil
local love_term_buf = nil

local function get_root() return vim.fs.root(0, { "main.lua", "conf.lua" }) end

function M.run()
  local root = get_root()

  if not root then return vim.notify("No LÖVE root", vim.log.levels.ERROR) end

  if love_job then return vim.notify "Already running" end

  love_job = vim.fn.jobstart("love .", {
    cwd = root,
    detach = true,
  })

  vim.notify "LÖVE started"
end

function M.runWithLog()
  local root = get_root()

  if not root then return vim.notify("No LÖVE root", vim.log.levels.ERROR) end

  if love_job then return vim.notify "Already running" end

  local Terminal = require("toggleterm.terminal").Terminal

  local love_term = Terminal:new {
    cmd = "lovec .",
    dir = root,
    direction = "horizontal",
    size = 12,
    close_on_exit = false,
    hidden = true,
  }

  love_term:toggle()

  love_job = love_term

  vim.notify "LÖVE started with console"
end
function M.stop()
  if love_job then
    love_job:shutdown()
    love_job = nil
    vim.notify "LÖVE stopped"
  end
end

vim.keymap.set("n", "<leader>vr", M.run, { desc = "Run LÖVE" })
vim.keymap.set("n", "<leader>vc", M.runWithLog, { desc = "Run LÖVE with console" })
vim.keymap.set("n", "<leader>ve", M.stop, { desc = "Stop LÖVE" })

return M
