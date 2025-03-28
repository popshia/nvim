-- icons for webdev

return {
   "nvim-tree/nvim-web-devicons",
   lazy = true,
   opts = {
      override = {
         sh = {
            icon = "",
            color = "#1DC123",
            cterm_color = "59",
            name = "Sh",
         },
      },
      override_by_filename = {
         [".gitattributes"] = {
            icon = "",
            color = "#e24329",
            cterm_color = "59",
            name = "GitAttributes",
         },
         [".gitconfig"] = {
            icon = "",
            color = "#e24329",
            cterm_color = "59",
            name = "GitConfig",
         },
         [".gitignore"] = {
            icon = "",
            color = "#e24329",
            cterm_color = "59",
            name = "GitIgnore",
         },
         [".gitlab-ci.yml"] = {
            icon = "",
            color = "#e24329",
            cterm_color = "166",
            name = "GitlabCI",
         },
         [".gitmodules"] = {
            icon = "",
            color = "#e24329",
            cterm_color = "59",
            name = "GitModules",
         },
      },
      override_by_extension = {
         ["diff"] = {
            icon = "",
            color = "#e24329",
            cterm_color = "59",
            name = "Diff",
         },
      },
   },
}
