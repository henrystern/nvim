vim.g.mkdp_auto_close = 0
vim.g.mkdp_filetypes = { "markdown", "quarto" }
vim.g.mkdp_page_title = "${name} - Live Preview"
vim.g.mkdp_markdown_css = vim.fn.stdpath "config" .. "/lua/custom/data/markdown_preview/styles.css"
vim.g.mkdp_highlight_css = vim.fn.stdpath "config" .. "/lua/custom/data/markdown_preview/highlights.css"
vim.g.mkdp_browser = "firefox"
-- for auto pop up
vim.g.mkdp_port = "6464"
-- https://addons.mozilla.org/en-CA/firefox/addon/popup/
-- Domain: "localhost:6464", Auto: True
-- Use AHK window spy for positioning but it doesn't work perfectly
-- Workarounds: +32 height to hide the title bar
