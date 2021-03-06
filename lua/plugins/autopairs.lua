local npairs = require("nvim-autopairs")
local Rule = require("nvim-autopairs.rule")

local remap = vim.api.nvim_set_keymap

npairs.setup(
    {
        enable_check_bracket_line = true,
        ignored_next_char = "[%w%.]" -- will ignore alphanumeric and `.` symbol
    }
)

_G.MUtils = {}

vim.g.completion_confirm_key = ""
MUtils.completion_confirm = function()
    if vim.fn.pumvisible() ~= 0 then
        if vim.fn.complete_info()["selected"] ~= -1 then
            return vim.fn["compe#confirm"](npairs.esc("<cr>"))
        else
            return npairs.esc("<cr>")
        end
    else
        return npairs.autopairs_cr()
    end
end

remap(
    "i",
    "<CR>",
    "v:lua.MUtils.completion_confirm()",
    {expr = true, noremap = true}
)

npairs.add_rules {
    Rule(" ", " "):with_pair(
        function(opts)
            local pair = opts.line:sub(opts.col - 1, opts.col)
            return vim.tbl_contains({"()", "[]", "{}"}, pair)
        end
    ),
    Rule("( ", " )"):with_pair(
        function()
            return false
        end
    ):with_move(
        function(opts)
            return opts.prev_char:match(".%)") ~= nil
        end
    ):use_key(")"),
    Rule("{ ", " }"):with_pair(
        function()
            return false
        end
    ):with_move(
        function(opts)
            return opts.prev_char:match(".%}") ~= nil
        end
    ):use_key("}"),
    Rule("[ ", " ]"):with_pair(
        function()
            return false
        end
    ):with_move(
        function(opts)
            return opts.prev_char:match(".%]") ~= nil
        end
    ):use_key("]")
}
