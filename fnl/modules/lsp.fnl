(import-macros {: map! : use-package! : sync-packages!} :macros)

(use-package! "https://github.com/neoclide/coc.nvim")
(sync-packages!)

(map! [i]
      :<tab>
      "coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? \"<tab>\" : coc#refresh()"
      {:silent true
       :noremap true
       :expr true
       :replace_keycodes false})
(map! [i]
      :<s-tab>
      "coc#pum#visible() ? coc#pum#prev(1) : \"\\<C-h>\""
      {:silent true
       :noremap true
       :expr true
       :replace_keycodes false})
(map! [i]
      :<cr>
      "coc#pum#visible() ? coc#pum#confirm() : \"\\<C-g>u\\<CR>\\<c-r>=coc#on_enter()\\<CR>\""
      {:silent true
       :noremap true
       :expr true
       :replace_keycodes false})
