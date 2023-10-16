local dap = require "dap"

dap.configurations.cpp = {
  {
    name = "Build and Debug",
    type = "codelldb",
    request = "launch",
    program = function()
      -- Compile and return exec name
      local filetype = vim.bo.filetype
      local filename = vim.fn.expand "%:p"
      local basename = vim.fn.expand "%:p:r"
      local makefile = os.execute "(ls | grep -i makefile)"
      if makefile == "makefile" or makefile == "Makefile" then
        os.execute "make debug"
      else
        if filetype == "c" then
          os.execute(string.format('gcc -g -o "%s.exe" "%s"', basename, filename))
        else
          os.execute(string.format('g++ -g -o "%s.exe" "%s"', basename, filename))
        end
      end
      return basename
    end,
    cwd = "${workspaceFolder}",
    MIMode = "gdb",
    miDebuggerPath = "/usr/bin/gdb",
    setupCommands = {
      {
        text = "-enable-pretty-printing",
        description = "enable pretty printing",
        ignoreFailures = false,
      },
    },
  },
}
dap.configurations.c = dap.configurations.cpp
