local M = {}

local love_job = nil

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

function M.stop()
  if love_job then
    vim.fn.jobstop(love_job)
    love_job = nil
    vim.notify "LÖVE stopped"
  end
end

vim.keymap.set("n", "<leader>vr", M.run, { desc = "Run LÖVE" })
vim.keymap.set("n", "<leader>ve", M.stop, { desc = "Stop LÖVE" })

return M
