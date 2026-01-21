(import-macros {: use-package! : sync-packages!} :macros)

(use-package! "https://github.com/windwp/nvim-autopairs")
(sync-packages!)

(let [{: setup} (require :nvim-autopairs)]
  (setup))
