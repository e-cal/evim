local dap = require("dap")
-- Lua commands to vim commands
Utils.make_command("DebugToggleBreakpoint", "require'dap'.toggle_breakpoint")
Utils.make_command("DebugContinue", "require'dap'.continue")
Utils.make_command("DebugStepInto", "require'dap'.step_into")
Utils.make_command("DebugStepOver", "require'dap'.step_over")
Utils.make_command("DebugStepOut", "require'dap'.step_out")
Utils.make_command("DebugStepBack", "require'dap'.step_back")
Utils.make_command("DebugToggleRepl", "require'dap'.repl.toggle")

vim.api.nvim_command("command! DebugListBreakpoints lua require'dap'.list_breakpoints(0)")

vim.cmd("hi DapBreakpoint guifg=#ff0000")
vim.fn.sign_define("DapBreakpoint", {
    text = "",
    texthl = "DapBreakpoint",
    linehl = "",
    numhl = "",
})

dap.defaults.fallback.external_terminal = {
    command = Debugger.externalTerminal,
    args = { "-e" },
}

-- UI
local dapui = require("dapui")

dapui.setup({
    icons = { expanded = "⯆", collapsed = "⯈", circular = "↺" },
    mappings = { expand = "<CR>", open = "o", remove = "d" },
    floating = {
        max_height = nil, -- These can be integers or a float between 0 and 1.
        max_width = nil, -- Floats will be treated as percentage of your screen.
    },
    layouts = {
        {
            elements = {
                "scopes",
                "breakpoints",
                "stacks",
                "watches",
            },
            size = 40,
            position = "left",
        },
        {
            elements = {
                "repl",
                "console",
            },
            size = 10,
            position = "bottom",
        },
    },
})

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

Utils.make_command("DebugFloatElement", "require'dapui'.float_element")
Utils.make_command("DebugToggleUI", "require'dapui'.toggle")
Utils.make_command("DebugEvaluate", "require'dapui'.eval")

-- Python
local opts = {}
if Debugger.useExternalTerminal then
    opts.console = "externalTerminal"
end
require("dap-python").setup(Debugger.pythonPath, opts)

Utils.make_command("PythonTestMethod", "require'dap-python'.test_method")
Utils.make_command("PythonTestClass", "require'dap-python'.test_class")
Utils.make_command("PythonDebugSelection", "require'dap-python'.debug_selection")
