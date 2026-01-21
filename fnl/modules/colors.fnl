(import-macros {: let!} :laurel.macros)
(import-macros {: colorscheme! : use-package! : sync-packages!} :macros)

(use-package! "https://github.com/nyoom-engineering/oxocarbon.nvim")
(sync-packages!)

(let! :o :background "dark")
(colorscheme! oxocarbon)

(vim.api.nvim_set_hl 0 "Normal" {:bg "none"})
(vim.api.nvim_set_hl 0 "NormalFloat" {:bg "none"})
(vim.api.nvim_set_hl 0 "NormalNC" {:bg "none"})
