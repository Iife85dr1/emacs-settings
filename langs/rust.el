(use-package rustic
  :ensure t
  :mode ("\\.rs$" . rustic-mode)
  
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
