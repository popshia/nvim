local M = {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
    lazy = "leetcode" ~= vim.fn.argv()[1],
    dependencies = {
        "MunifTanjim/nui.nvim",
    },
}

function M.config()
	require("leetcode").setup({
        arg = "leetcode",
        lang = "cpp",
        console = {
            open_on_runcode = true, ---@type boolean
            dir = "row", ---@type "col" | "row"
            size = {
                width = "90%", ---@type string | integer
                height = "75%", ---@type string | integer
            },
            result = {
                size = "60%", ---@type string | integer
            },
            testcase = {
                virt_text = true, ---@type boolean
                size = "40%", ---@type string | integer
            },
        },
        description = {
            position = "left", ---@type "top" | "right" | "bottom" | "left"
            width = "40%", ---@type string | integer
        },
    })
end

return M
