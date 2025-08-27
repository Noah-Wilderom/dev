require("nwpersonal.helpers.keyboard")

vim.g.mapleader = " "

local isMacOS = vim.loop.os_uname().sysname == "Darwin"

nm("<leader>w", ":w<CR>", "Save file")

nm("<leader>ff", function()
	require("telescope.builtin").find_files({
		hidden = true,
	})
end, "Find files")
nm("<leader>fC", function()
	require("telescope.builtin").find_commands({
		hidden = true,
	})
end, "Find commands")
nm("<Leader>fc", function()
	require("telescope.builtin").grep_string({
		hidden = true,
	})
end, "Find word under cursor")
nm("<Leader>fh", function()
	require("telescope.builtin").oldfiles({
		hidden = true,
	})
end, "Find history")
nm("<Leader>fg", function()
	require("telescope.builtin").live_grep()
end, "Find history")
nm("<Leader>fm", function()
	require("telescope.builtin").colorscheme({
		enable_preview = true,
	})
end, "Find themes")
nm("<Leader>ft", "<cmd>PulseList<CR>", "Find timers")

nm("<leader>gf", function()
	require("telescope.builtin").git_files({
		hidden = true,
	})
end, "Git files")
nm("<Leader>gb", function()
	require("telescope.builtin").git_branches({
		use_file_path = true,
	})
end, "Git branches")

nm("<Leader>gc", function()
	require("telescope.builtin").git_commits({
		use_file_path = true,
	})
end, "Git commits (repository)")

nm("<Leader>gC", function()
	require("telescope.builtin").git_bcommits({
		use_file_path = true,
	})
end, "Git commits (current file)")

nm("<Leader>gt", function()
	require("telescope.builtin").git_status({
		use_file_path = true,
	})
end, "Git status")

nm("<Leader>/", function()
	require("Comment.api").toggle.linewise.current()
end, "Toggle comment line")

nm(
	"<Leader>/",
	"<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
	"Toggle comment for selection"
)

-- File Explorer
-- nm("<leader>ee", "<cmd>Lexplore<CR>", "Toggle Netrw file explorer")
nm("<leader>ee", "<cmd>NvimTreeToggle<CR>", "Toggle NvimTree file explorer")
nm("<leader>ef", "<cmd>NvimTreeFocus<CR>", "Focus NvimTree file explorer")

nm("<leader>lf", function()
	local conform = require("conform")
	local notify = require("notify")
	conform.format({ async = true }, function(err, did_edit)
		if err then
			notify(err, "error")
		elseif did_edit then
			notify("File formatted", "info")
		end
	end)
end, "Format File")

if isMacOS then
	nm("<D-s>", ":w<CR>", "Save file (Cmd+S)")
	im("<D-s>", "<Esc>:w<CR>", "Save file (Cmd+S) from insert mode")
end
