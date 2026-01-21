(import-macros {: use-package! : sync-packages!} :macros)

(use-package! "https://github.com/nvim-tree/nvim-web-devicons")
(use-package! "https://github.com/DaikyXendo/nvim-material-icon")
(sync-packages!)

(local {: setup}
       (require :nvim-web-devicons))

(setup)
