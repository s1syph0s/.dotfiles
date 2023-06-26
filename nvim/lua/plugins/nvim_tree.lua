local config = {
    renderer = {
        group_empty = true,
        highlight_modified = "icon",
    },
    modified = {
        enable = true,
        show_on_dirs = true,
    },
    diagnostics = {
        enable = true
    },
}

require("nvim-tree").setup(config)
