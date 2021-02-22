(use-package rustic
  :ensure t
  :mode ("\\.rs$" . rustic-mode)

  :init
  (setq rustic-format-trigger 'on-save)
  (setq buffer-save-without-query t)
  
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
