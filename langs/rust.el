(use-package rustic
  :ensure t
  :mode ("\\.rs$" . rustic-mode)

  :hook
  (before-save . lsp-format-buffer)
  :init
  (setq rustic-lsp-server 'rust-analyzer
        buffer-save-without-query t
        company-idle-delay 0.1)
  (push 'rustic-clippy flycheck-checkers)
  
  :config
  (setq compile-command "cargo build")

  (my-local-leader
    :states  '(normal emacs)
    :keymaps 'rustic-mode-map
    :wk "Rutic"
  
    "b" '(:ignore :wk "cargo build")
    "bb" 'rustic-cargo-build
    "bc" 'rustic-cargo-clean

    "r" 'rustic-cargo-run
    "t" 'rustic-cargo-test
  )
)
