local map = function(lhs, rhs, desc)
	if desc then
		desc = "[DAP] " .. desc
	end

	vim.keymap.set("n", lhs, rhs, { silent = true, desc = desc })
end
map("<F1>", require("dap").step_back, "step_back")
map("<F2>", require("dap").step_into, "step_into")
map("<F3>", require("dap").step_over, "step_over")
map("<F4>", require("dap").step_out, "step_out")
map("<F5>", require("dap").continue, "continue")
map("<F6>", require("dap").close, "close debugger")
map("<F9>", require("dap").toggle_breakpoint, "toggle_breakpoint")

local dap = require("dap")
dap.adapters.cppdbg = {
	id = "cppdbg",
	type = "executable",
	command = "/home/marcus/.vscode/extensions/ms-vscode.cpptools-1.15.4-linux-x64/debugAdapters/bin/OpenDebugAD7",
}
dap.configurations.cpp = {
	{
		name = "Launch file",
		type = "cppdbg",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopAtEntry = true,
	},
	{
		name = "Attach to gdbserver :1234",
		type = "cppdbg",
		request = "launch",
		MIMode = "gdb",
		-- miDebuggerServerAddress = 'localhost:1234',
		miDebuggerPath = "/usr/bin/gdb",
		cwd = "${workspaceFolder}",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
	},
	{
		name = "hello!",
		type = "cppdbg",
		request = "launch",
		MIMode = "gdb",
		-- miDebuggerServerAddress = 'localhost:1234',
		miDebuggerPath = "/usr/bin/gdb",
		cwd = "${workspaceFolder}",
		program = "/home/marcus/code/rndm/cpp-playground/hello",
	},
}

-- Python
dap.adapters.python = {
	type = "executable",
	command = "/home/marcus/code/rndm/python-playground/debugpy/bin/python",
	args = { "-m", "debugpy.adapter" },
}

dap.configurations.python = {
	{
		type = "python",
		request = "launch",
		name = "Launch file",

		program = "${file}",
		pythonPath = function()
			local cwd = vim.fn.getcwd()
			if vim.fn.executable(cwd .. "/.aoc-venv/bin/python") == 1 then
				return cwd .. "/.aoc-venv/bin/python"
			else
				return "/usr/bin/python3"
			end
		end,
	},
}

local dapui = require("dapui")
dapui.setup()
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end
