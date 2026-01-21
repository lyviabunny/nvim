(import-macros {: map! : use-package! : sync-packages!} :macros)

(map! [n] :<leader>tn ":tabnew<CR>"
      {:silent true :desc "open new tab"})
(map! [n] :<leader>tk ":tabclose<CR>"
      {:silent true :desc "close tab"})
(map! [n] :<leader><Right>":tabnext<CR>"
      {:silent true :desc "next tab"})
(map! [n] :<leader><Left> ":tabprevious<CR>"
      {:silent true :desc "previous tab"})
