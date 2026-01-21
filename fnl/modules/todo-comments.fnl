(import-macros {: use-package! : sync-packages!} :macros)

(use-package! "https://github.com/folke/todo-comments.nvim")
(sync-packages!)

(let [{: setup} (require :todo-comments)]
  (setup))
