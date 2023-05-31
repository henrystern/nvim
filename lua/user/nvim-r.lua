local M = {
  "jalvesaq/Nvim-R",
  lazy = true,
  ft = {'r', 'rmd', 'rrst', 'rnoweb', 'quarto', 'rhelp'},
  init = function()
    vim.g.R_disable_cmds = {'RCustomStart', 'RSaveClose', 'RClearAll', 'RSimpleComment', 'RSimpleUnComment', 'RToggleComment', 'RRightComment', 'RIndent', 'RNextRChunk', 'RPreviousRChunk', 'RNLeftPart', 'RNRightPart', 'RILeftPart', 'RIRightPart', 'RESendSelection', 'RDSendSelection', 'REDSendSelection', 'RSendMotion', 'RSendSelAndInsertOutput', 'RSendMBlock', 'RESendMBlock', 'RDSendMBlock', 'REDSendMBlock', 'RSendParagraph', 'RESendParagraph', 'RDSendParagraph', 'REDSendParagraph', 'RESendFunction', 'RDSendFunction', 'REDSendFunction', 'RShowEx', 'RShowRout', 'RViewDFs', 'RViewDFa', 'RDputObj', 'RSetwd', 'RListSpace', 'RSendChunk', 'RDSendChunk', 'RESendChunk', 'REDSendChunk', 'RSendChunkFH', 'RBibTeX', 'RBibTeXK', 'RSweave', 'RKnit', 'RMakeHTML', 'RMakePDF', 'RMakePDFK', 'RMakePDFKb', 'RMakeODT', 'RMakeWord', 'RMakeRmd', 'RMakeAll', 'ROpenPDF', 'RSyncFor', 'RGoToTeX', 'RSpinFile', 'RNextRChunk', 'RPreviousRChunk', 'RQuartoRender', 'RQuartoPreview', 'RQuartoStop', 'ROpenRefFile', 'RDebug', 'RUndebug', 'ROpenLists', 'RCloseLists'}
  end
}


return M
