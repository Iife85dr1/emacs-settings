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

  ;; ** Global Keybindings
    "p" '(:keymap  projectile-command-map :wk "projectile")
    "g" 'magit-status
    "." 'find-file
    ;; "," 'counsel-switch-buffer
    "a" 'org-agenda

    "c" '(:ignore :wk "Compile")
    "cc" 'compile
    "cC" 'recompile
    "cr" 'cmake-command-run

    "f" '(:ignore :wf "files")
    "fr" 'counsel-recentf

    )
  
  ;;magit
  (general-setq evil-search-module 'evil-search)
)
