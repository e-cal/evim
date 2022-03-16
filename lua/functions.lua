local api = vim.api

-- Trim whitespace
TrimWhitespace = function()
    api.nvim_exec(
        [[
    let _save = winsaveview()
    keeppatterns silent! %s#\($\n\s*\)\+\%$##
    ]],
        false
    )
    api.nvim_exec("call winrestview(_save)", false)
end
Utils.make_command("TrimWhitespace")

-- Folds in markdown
api.nvim_exec(
    [[
function! MarkdownLevel()
    if getline(v:lnum) =~ '^# .*$'
        return ">1"
    endif
    if getline(v:lnum) =~ '^## .*$'
        return ">2"
    endif
    if getline(v:lnum) =~ '^### .*$'
        return ">3"
    endif
    if getline(v:lnum) =~ '^#### .*$'
        return ">4"
    endif
    if getline(v:lnum) =~ '^##### .*$'
        return ">5"
    endif
    if getline(v:lnum) =~ '^###### .*$'
        return ">6"
    endif
    return "="
endfunction
]],
    false
)

-- Paste images
local paste_cmd = Markdown.imagePasteCommand

local create_dir = function(dir)
    if vim.fn.isdirectory(dir) == 0 then
        vim.fn.mkdir(dir, "p")
    end
end

local get_name = function()
    local index = 1
    for _ in io.popen("ls img"):lines() do
        index = index + 1
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
    local name = get_name()
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

FormatToggle = function()
    local enabled = api.nvim_get_var("formatOnSave")
    if enabled then
        api.nvim_set_var("formatOnSave", false)
    else
        api.nvim_set_var("formatOnSave", true)
    end
end
Utils.make_command("FormatOnSave")

FormatOnSave = function()
    local enabled = api.nvim_get_var("formatOnSave")
    if enabled then
        api.nvim_command("Format")
    end
end
Utils.make_command("FormatToggle")

CleanTextSoft = function()
    api.nvim_command("%s/–\\|•\\|▪/-/ge")
    api.nvim_command("%s/■/- /ge")
    api.nvim_command("%s/❑/↳ /ge")
    api.nvim_command("%s/’/'/ge")
    api.nvim_command('%s/“\\|”/"/ge')
end
Utils.make_command("CleanTextSoft")

CleanTextInv = function()
    api.nvim_command("%s/–\\|•/- /ge")
    api.nvim_command("%s/’/'/ge")
    api.nvim_command('%s/“\\|”/"/ge')
end
Utils.make_command("CleanTextInv")
