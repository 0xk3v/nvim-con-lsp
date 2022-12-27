local colorscheme = 'darkplus'

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

-- Checking for Errors
if not status_ok then
  vim.notify("  : Colorscheme " .. colorscheme .."Not Found :(")
  return
end
