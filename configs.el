(setq lsp-clients-clangd-args '("-j=6"
                                "--background-index"
                                "--clang-tidy"
                                "--completion-style=detailed"
                                "--header-insertion=never"
                                "--compile-commands-dir=Debug/"
                                "--fallback-style=microsoft"))

;; Custom compile command
(setq compile-command "cmake --build Debug/ -j 6")

(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024))
