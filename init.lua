require "custom.autocommands"
require "custom.options"
vim.opt.rtp:prepend(vim.fn.stdpath "config" .. "/lua/custom/runtime")
