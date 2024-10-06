local M = {}

M.setup = function()
    require("nvim-tree").setup({
        sync_root_with_cwd = true,
        sort = {
            sorter = "case_sensitive",
        },
        view = {
            width = 30,
            side = "right",
        },
        renderer = {
            group_empty = true,
        },
        filters = {
            dotfiles = false,
        },
        actions = {
            change_dir = {
                enable = false,
                restrict_above_cwd = true,
            }
        },
        renderer = {
            highlight_git = true,
            indent_markers = { enable = true },
            icons = {
                glyphs = {
                    default = "󰈚",
                    folder = {
                        default = "",
                        empty = "",
                        empty_open = "",
                        open = "",
                        symlink = "",
                    },
                    git = { unmerged = "" },
                },
            },
        },
    })
end

return M.setup()
