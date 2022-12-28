vim.cmd [[
try
  colorscheme tokyodark 
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
