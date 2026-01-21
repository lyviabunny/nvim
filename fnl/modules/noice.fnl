(import-macros {: use-package! : sync-packages!} :macros)

(use-package! "https://github.com/MunifTanjim/nui.nvim")
(use-package! "https://github.com/rcarriga/nvim-notify")
(use-package! "https://github.com/folke/noice.nvim")
(sync-packages!)

(let [{: setup} (require :noice)]
  (setup {:health {:checker false}
       :cmdline {:format {:cmdline {:pattern "^:"
                                    :icon " "
                                    :lang :vim}
                          :search_down {:kind :search
                                        :pattern "^/"
                                        :icon " "
                                        :lang :regex}
                          :search_up {:kind :search
                                      :pattern "^%?"
                                      :icon " "
                                      :lang :regex}
                          :filter {:pattern "^:%s*!"
                                   :icon "$"
                                   :lang :bash}
                          :lua {:pattern "^:%s*lua%s+"
                                :icon ""
                                :lang :lua}
                          :help {:pattern "^:%s*h%s+"}
                          :input {}}
                 :opts {:win_options {:winhighlight {:Normal :NormalFloat
                                                     :FloatBorder :FloatBorder}}}}
       :lsp {:progress {:enabled true}
             :override {:vim.lsp.util.convert_input_to_markdown_lines true
                        :vim.lsp.util.stylize_markdown true
                        :cmp.entry.get_documentation true}}
       :presets {:long_message_to_split true}
       :format {}}))

(let [{: setup} (require :notify)]
  (setup {:background_colour "#131313"}))
