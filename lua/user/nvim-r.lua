local M = {
  "jalvesaq/Nvim-R",
  lazy = true,
  ft = {'r', 'rmd', 'rrst', 'rnoweb', 'quarto', 'rhelp'},
  init = function()
    vim.g.R_disable_cmds = {'RCustomStart', 'RSaveClose', 'RClearAll', 'RSimpleComment', 'RSimpleUnComment', 'RToggleComment', 'RRightComment', 'RIndent', 'RNextRChunk', 'RPreviousRChunk', 'RNLeftPart', 'RNRightPart', 'RILeftPart', 'RIRightPart', 'RESendSelection', 'RDSendSelection', 'REDSendSelection', 'RSendMotion', 'RSendSelAndInsertOutput', 'RSendMBlock', 'RESendMBlock', 'RDSendMBlock', 'REDSendMBlock', 'RSendParagraph', 'RESendParagraph', 'RDSendParagraph', 'REDSendParagraph', 'RESendFunction', 'RDSendFunction', 'REDSendFunction', 'RShowEx', 'RShowRout', 'RViewDFs', 'RViewDFa', 'RDputObj', 'RSetwd', 'RListSpace', 'RSendChunk', 'RDSendChunk', 'RESendChunk', 'REDSendChunk', 'RSendChunkFH', 'RBibTeX', 'RBibTeXK', 'RSweave', 'RKnit', 'RMakeHTML', 'RMakePDF', 'RMakePDFK', 'RMakePDFKb', 'RMakeODT', 'RMakeWord', 'RMakeRmd', 'RMakeAll', 'ROpenPDF', 'RSyncFor', 'RGoToTeX', 'RSpinFile', 'RNextRChunk', 'RPreviousRChunk', 'RQuartoRender', 'RQuartoPreview', 'RQuartoStop', 'ROpenRefFile', 'RDebug', 'RUndebug', 'ROpenLists', 'RCloseLists'}
    vim.g.R_close_term = true
    vim.g.R_esc_term = true
    vim.g.R_min_editor_width = 80   -- Source editor should be at least 80 col
    vim.g.R_rconsole_width = 1000   -- Console takes up whole width
    vim.g.R_rconsole_height = 15    -- Console isn't too tall
    vim.g.R_objbr_place = 'RIGHT'
    vim.g.R_objbr_w = 55
    vim.g.R_objbr_opendf = 0        -- Don't expand dataframe in obj browser
    vim.g.R_assign = 0
    vim.g.R_rmdchunk = 0
    vim.g.R_csv_delim = ','
    vim.g.R_nvimpager = "tab"
  end
}


return M
