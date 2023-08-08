local api = vim.api

-- Trim whitespace
TrimWhitespace = function()
	local patterns = {
		[[%s/\s\+$//e]],
		[[%s/\($\n\s*\)\+\%$//]],
		[[%s/\%^\n\+//]],
		[[%s/\(\n\n\)\n\+/\1/]],
	}
	local save = vim.fn.winsaveview()
	for _, v in pairs(patterns) do
		api.nvim_exec(string.format("keepjumps keeppatterns silent! %s", v), false)
	end
	vim.fn.winrestview(save)
end
Utils.make_command("TrimWhitespace")

-- Formatting
FormatToggle = function()
	local enabled = api.nvim_get_var("formatOnSave")
	if enabled then
		api.nvim_set_var("formatOnSave", false)
	else
		api.nvim_set_var("formatOnSave", true)
	end
end
Utils.make_command("FormatToggle")

Format = function()
	vim.lsp.buf.format({ timeout_ms = 30000 })
	vim.cmd("write")
end
Utils.make_command("Format")

FormatOnSave = function()
	local enabled = api.nvim_get_var("formatOnSave")
	if enabled then
		Format()
	end
end
Utils.make_command("FormatOnSave")

-- Paste images
local paste_cmd = Markdown.imagePasteCommand

local create_dir = function(dir)
	if vim.fn.isdirectory(dir) == 0 then
		vim.fn.mkdir(dir, "p")
	end
end

local get_name = function(start)
	local index = start
	for f in io.popen("ls img"):lines() do
		if string.find(f, "image%d%d%d%d.png") then
			index = index + 1
		end
	end
	local prefix = ""
	if index < 10 then
		prefix = "000"
	elseif index < 100 then
		prefix = "00"
	elseif index < 1000 then
		prefix = "0"
	end
	return "image" .. prefix .. index
end

PasteImg = function()
	create_dir(Markdown.imageDir)
	local name = get_name(1)
	local path = string.format(Markdown.imageDir .. "/%s.png", name)
	os.execute(string.format(paste_cmd, path))

	local template
	local size = Markdown.imageDefaultWidth
	if Markdown.imagePasteSyntax == "html" then
		if size ~= nil then
			template = '<img src="%s" width=' .. size .. "px />"
		else
			template = '<img src="%s" />'
		end
	elseif Markdown.imagePasteSyntax == "obsidian" then
		if size ~= nil then
			template = "![[%s|" .. size .. "]]"
		else
			template = "![[%s]]"
		end
	else
		template = Markdown.imagePasteSyntax
	end
	local pasted_txt = string.format(template, path)
	vim.cmd("normal a" .. pasted_txt)
end
Utils.make_command("PasteImg")

DelLastImg = function()
	local name = get_name(0)
	local path = string.format(Markdown.imageDir .. "/%s.png", name)
	os.execute(string.format("rm %s", path))
end
Utils.make_command("DelLastImg")

CleanText = function()
	api.nvim_command("%s/–\\|•\\|▪/-/ge")
	api.nvim_command("%s/■/-/ge")
	api.nvim_command("%s/❑/↳ /ge")
	api.nvim_command("%s/’\\|‘/'/ge")
	api.nvim_command('%s/“\\|”/"/ge')
end
Utils.make_command("CleanText")

PS = function()
	api.nvim_command("PackerSync")
end
Utils.make_command("PS")

NewFile = function()
	local name = vim.fn.input("File name: ", "", "file")
	api.nvim_command("e " .. name)
end
Utils.make_command("NewFile")

TelescopeSearchDotfiles = function()
	require("telescope.builtin").find_files({ prompt_title = " Config ", cwd = "$DOTFILES/.config" })
end
Utils.make_command("TelescopeSearchDotfiles")

TelescopeSearchDir = function()
	local dir = vim.fn.input("Search from: ", "~/")
	if dir ~= "" and dir ~= nil then
		require("telescope.builtin").find_files({ prompt_title = string.format(" Searching %s ", dir), cwd = dir })
	else
		require("telescope.builtin").find_files()
	end
end
Utils.make_command("TelescopeSearchDir")

PreviewDoc = function()
	local filetype = vim.bo.filetype
	if filetype == "markdown" then
		api.nvim_command("MarkdownPreviewToggle")
	elseif filetype == "tex" then
		api.nvim_command("VimtexCompile")
	end
end
Utils.make_command("PreviewDoc")

UpdateWinbarHighlight = function()
	local bufnr = vim.api.nvim_get_current_buf()
	local is_modified = vim.api.nvim_buf_get_option(bufnr, "modified")

	if is_modified then
		vim.cmd("highlight WinBar guifg=#f4dbd6")
	else
		local normal_fg = vim.api.nvim_get_hl_by_name("Normal", true).foreground
		vim.cmd("highlight WinBar guifg=" .. normal_fg)
	end
end
Utils.make_command("UpdateWinbarHighlight")

History = function(num)
	-- print the num most recent oldfiles
	local oldfiles = vim.v.oldfiles
	local start = #oldfiles - num + 1
	if start < 1 then
		start = 1
	end
	for i = start, #oldfiles do
		local file = oldfiles[i]
		print(file)
	end
end
Utils.make_command("History")

OpenLast = function()
	vim.cmd("e " .. vim.v.oldfiles[1])
end
Utils.make_command("OpenLast")

AltTab = function()
	vim.cmd("silent! w")
	vim.cmd("silent! e #")
end
Utils.make_command("AltTab")

Print = function(t)
    print(vim.inspect(t))
end
Utils.make_command("Print")
