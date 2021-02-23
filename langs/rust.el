(use-package rustic
  :ensure t
  :mode ("\\.rs$" . rustic-mode)

  :init
  (setq rustic-format-trigger 'on-save
        buffer-save-without-query t
        company-idle-delay 0.2)
  
  :config
  (my-local-leader
    :states  '(normal emacs)
    :keymaps 'rustic-mode-map
    :wk "Rutic"
  
    "b" '(:ignore )
    "bb" 'rustic-cargo-build
    "br" 'rustic-cargo-run
    "bc" 'rustic-cargo-clean
  )
)
