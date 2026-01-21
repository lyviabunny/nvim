(tset _G :lopunny/pkgs [])
(tset _G :lopunny/modules {})

(fn car-call [state ...]
  (when (= state nil)
    (error "head: iterator is empty"))
  ...)

(fn car [gen param state]
  (car-call (gen param state)))

(lambda colorscheme! [scheme]
  "sets the colorscheme using the vim.api.nvim_cmd API"
  (assert-compile (sym? scheme) "expected symbol for colorscheme name" scheme)
  (let [scheme (tostring scheme)]
    `(vim.api.nvim_cmd {:cmd :colorscheme :args [,scheme]} {})))

(lambda vlua [x]
  "maps a symbol to `v:lua.x()` where `x` is the symbol"
  (assert-compile (sym? x) "expected symbol for x" x)
  (string.format "v:lua.%s()" (tostring x)))

(fn nil? [x]
  "checks if `x` is nil"
  (= nil x))

(fn str? [x]
  "checks if `x` is a string"
  (= :string (type x)))

(lambda fn? [x]
  "checks if `x` is a function definition"
  (and (list? x)
       (or (= `fn (car x))
           (= `hashfn (car x))
           (= `lambda (car x))
           (= `partial (car x)))))

(lambda quoted? [x]
  "checks if `x` is a quoted expression"
  (and (list? x) (= `quote (car x))))

(lambda quoted->fn [expr]
  "convers a quoted expression like `(quote (+ 1 1))` into a function like `(fn [] (+ 1 1))`"
  (assert-compile (quoted? expr) "expected quoted expression for expr" expr)
  (let [non-quoted (. expr 2)]
    `(fn []
       ,non-quoted)))

(lambda quoted->str [expr]
  "converts a quoted expression like `(quote (+ 1 1))` into an string with its shorthand form"
  (assert-compile (quoted? expr) "expected quoted expression for expr" expr)
  (let [non-quoted (. expr 2)]
    (.. "'" (view non-quoted))))

(lambda map! [[modes] keymap callback ?options]
  "adds a new key mapping via the vim.keymap.set API"
  (assert-compile (sym? modes) "expected symbol for modes" modes)
  (assert-compile (str? keymap) "expected string for keymap" keymap)
  (assert-compile (or (str? callback)
                      (sym? callback)
                      (fn? callback)
                      (quoted? callback))
                  "expected string, symbol, function or quoted expression for callback"
                  callback)
  (assert-compile (or (nil? ?options) (table? ?options))
                  "expected table for options"
                  ?options)
  (let [modes
         (icollect [char (string.gmatch (tostring modes) ".")]
           char)
        options (or ?options {})
        options (if (nil? options.desc)
                    (doto options
                      (tset :desc
                            (if (quoted? callback) (quoted->str callback)
                                (str? callback) callback
                                (view callback))))
                    options)
        callback (if (quoted? callback) (quoted->fn callback)
                     callback)]
    `(vim.keymap.set ,modes ,keymap ,callback ,options)))

(lambda use-package! [src]
  "declares a plugin with its options"
  (assert-compile (str? src) "expected string for src" src)
  (table.insert _G.lopunny/pkgs {:src src}))

(lambda all-packages []
  "evaluates to a table of all declared plugins"
  _G.lopunny/pkgs)

(lambda sync-packages! []
  "installs all declared packages"
  `(vim.pack.add ,_G.lopunny/pkgs {:confirm false}))

{: colorscheme!
 : vlua
 : map!
 : use-package!
 : all-packages
 : sync-packages!}
