(use-package general
  :ensure t
  :config
  ;; `general-def' can be used instead for `evil-global-set-key'-like syntax
  (general-def 'motion
    ";" 'evil-repeat-find-char
    ":" 'evil-ex)

  ;; * Mode Keybindings
  ;; Global leader
  (general-create-definer my-leader-def
    :prefix "SPC")

  ;; Local leader for modes
  (general-create-definer my-local-leader
    :prefix "SPC m")

  ;;** counsel projectile
  (my-leader-def
    :keymaps 'normal

    "p" '(:keymap  projectile-command-map :wk "projectile")
    "g" 'magit-status
    "." 'treemacs
  )
 
  ;; ** Global Keybindings
  (my-leader-def
    :keymaps 'normal
    "a" 'org-agenda
    "c" 'org-capture
    "," 'ivy-switch-buffer
  )

  (my-leader-def
    :keymaps 'normal
    "c" 'compile)

  ;;magit
  (general-setq evil-search-module 'evil-search)
)



