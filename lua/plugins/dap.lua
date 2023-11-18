local function get_args(config)
	local args = type(config.args) == "function" and (config.args() or {}) or config.args or {}
	config = vim.deepcopy(config)
	---@cast args string[]
	config.args = function()
		local new_args = vim.fn.input("Run with args: ", table.concat(args, " ")) --[[@as string]]
		return vim.split(vim.fn.expand(new_args) --[[@as string]], " ")
	end
	return config
end

return {
	{
		"leoluz/nvim-dap-go",
		event = "BufEnter",
		ft = "go",
		config = function()
			require("dap-go").setup()
		end,
	},
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			-- fancy UI for the debugger
			{
				"rcarriga/nvim-dap-ui",
				-- stylua: ignore
				keys = {
					{ "<leader>du", function() require("dapui").toggle({ }) end, desc = "Dap UI" },
					{ "<leader>de", function() require("dapui").eval() end, desc = "Eval", mode = {"n", "v"} },
				},
				opts = {
					controls = {
						element = "repl",
						enabled = true,
						icons = {
							disconnect = Icons.dap.disconnect,
							pause = Icons.dap.pause,
							play = Icons.dap.pause,
							run_last = Icons.dap.run_last,
							step_back = Icons.dap.step_back,
							step_into = Icons.dap.step_into,
							step_out = Icons.dap.step_out,
							step_over = Icons.dap.step_over,
							terminate = Icons.dap.terminate,
						},
					},
				},
				config = function(_, opts)
					-- setup dap config by VsCode launch.json file
					-- require("dap.ext.vscode").load_launchjs()
					local dap = require("dap")
					local dapui = require("dapui")
					dapui.setup(opts)
					dap.listeners.after.event_initialized["dapui_config"] = function()
						dapui.open({})
					end
					dap.listeners.before.event_terminated["dapui_config"] = function()
						dapui.close({})
					end
					dap.listeners.before.event_exited["dapui_config"] = function()
						dapui.close({})
					end
				end,
			},

			-- virtual text for the debugger
			{
				"theHamsta/nvim-dap-virtual-text",
				opts = {},
			},

			-- which key integration
			{
				"folke/which-key.nvim",
				optional = true,
				opts = {
					defaults = {
						["<leader>d"] = { name = "+debug" },
					},
				},
			},
		},
		-- stylua: ignore
		keys = {
			{ "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
			{ "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
			{ "<leader>dc", function() require("dap").continue() end, desc = "Continue" },
			{ "<leader>da", function() require("dap").continue({ before = get_args }) end, desc = "Run with Args" },
			{ "<leader>dC", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
			{ "<leader>dg", function() require("dap").goto_() end, desc = "Go to line (no execute)" },
			{ "<leader>di", function() require("dap").step_into() end, desc = "Step Into" },
			{ "<leader>dj", function() require("dap").down() end, desc = "Down" },
			{ "<leader>dk", function() require("dap").up() end, desc = "Up" },
			{ "<leader>dl", function() require("dap").run_last() end, desc = "Run Last" },
			{ "<leader>do", function() require("dap").step_out() end, desc = "Step Out" },
			{ "<leader>dO", function() require("dap").step_over() end, desc = "Step Over" },
			{ "<leader>dp", function() require("dap").pause() end, desc = "Pause" },
			{ "<leader>dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
			{ "<leader>ds", function() require("dap").session() end, desc = "Session" },
			{ "<leader>dt", function() require("dap").terminate() end, desc = "Terminate" },
			{ "<leader>dw", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },
		},

		-- stylua: ignore
		config = function()
			vim.fn.sign_define("DapStopped", { text = Icons.dap.stopped, texthl = "DiagnosticWarn", linehl = "DapStoppedLine", numhl = "DapStoppedLine", })
			vim.fn.sign_define("DapBreakpoint", { text = Icons.dap.breakpoint, texthl = "DiagnosticInfo" })
			vim.fn.sign_define("DapBreakpointCondition", { text = Icons.dap.breakpoint_condition, texthl = "DiagnosticInfo" })
			vim.fn.sign_define("DapBreakpointRejected", { text = Icons.dap.breakpoint_rejected, texthl = "DiagnosticError" })
			vim.fn.sign_define("DapLogPoint", { text = Icons.dap.log_point, texthl = "DiagnosticInfo" })

			vim.api.nvim_set_hl(0, "DapStoppedLine", {
				default = true,
				link = "Visual",
			})
		end,
	},
}
