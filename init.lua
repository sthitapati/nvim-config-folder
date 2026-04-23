if vim.fn.has("linux") == 1 then
  vim.env.PATH = "/home/linuxbrew/.linuxbrew/bin:" .. vim.env.PATH
elseif vim.fn.has("mac") == 1 then
  vim.env.PATH = "/opt/homebrew/bin:" .. vim.env.PATH
end

require("sthita.core")
require("sthita.lazy")
pcall(require, "sthita.theme") -- load saved theme from themery
