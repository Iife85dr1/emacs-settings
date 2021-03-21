(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode)
  :config
  (setq flycheck-indication-mode 'right-fringe)
  (define-fringe-bitmap 'flycheck-fringe-bitmap-double-arrow
      [16 48 112 240 112 48 16] nil nil 'center))

(use-package lsp-mode
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         (python-mode . lsp)
         ; (c++-mode . lsp)
         (c++-mode . (lambda()
                       (add-hook 'before-save-hook #'lsp-format-buffer t t)
                       (setq compile-command "cmake --build Debug/ -j 6")
                       (lsp)))
         (vue-mode . lsp)
         (web-mode . lsp)
         (rustic-mode . lsp)
         (cmake-mode . lsp)
         (ruby-mode . lsp)
		 (go-mode . lsp)
         (yaml-mode . lsp)
         (before-save-hook . lsp-format-buffer)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :config
	(add-hook 'go-mode-hook #'lsp-deferred)
  (setq lsp-print-performance t
        lsp-headerline-breadcrumb-enable t
        lsp-idle-delay 0.1
        lsp-prefer-capf t
        lsp-completion-provider :capf
        lsp-completion-enable t
        )
  :commands lsp)


;; optionally
(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :config
  (setq lsp-ui-sideline-show-diagnostics t
        lsp-ui-sideline-show-code-actions t
        lsp-ui-sideline-ignore-duplicate t
        lsp-ui-sideline-show-code-actions nil

        lsp-enable-snippet t

        lsp-log-io nil

        lsp-ui-doc-enable nil
        lsp-ui-doc-delay 0
        lsp-ui-doc-position 'at-point
        )
  ;; (evil-global-set-key 'normal (kbd "K") 'lsp-ui-doc-show)
  (evil-global-set-key 'normal (kbd "K") 'lsp-describe-thing-at-point)
  (setq lsp-signature-auto-activate nil)
  )

(use-package treemacs
  :ensure t
  :config
  (progn
    (setq treemacs-collapse-dirs                 (if treemacs-python-executable 3 0)
          treemacs-deferred-git-apply-delay      0.5
          treemacs-directory-name-transformer    #'identity
          treemacs-display-in-side-window        t
          treemacs-eldoc-display                 t
          treemacs-file-event-delay              5000
          treemacs-file-extension-regex          treemacs-last-period-regex-value
          treemacs-file-follow-delay             0.2
          treemacs-file-name-transformer         #'identity
          treemacs-follow-after-init             t
          treemacs-git-command-pipe              ""
          treemacs-goto-tag-strategy             'refetch-index
          treemacs-indentation                   2
          treemacs-indentation-string            " "
          treemacs-is-never-other-window         nil
          treemacs-max-git-entries               5000
          treemacs-missing-project-action        'ask
          treemacs-move-forward-on-expand        nil
          treemacs-no-png-images                 nil
          treemacs-no-delete-other-windows       t
          treemacs-project-follow-cleanup        nil
          treemacs-persist-file                  (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
          treemacs-position                      'left
          treemacs-read-string-input             'from-child-frame
          treemacs-recenter-distance             0.1
          treemacs-recenter-after-file-follow    nil
          treemacs-recenter-after-tag-follow     nil
          treemacs-recenter-after-project-jump   'always
          treemacs-recenter-after-project-expand 'on-distance
          treemacs-show-cursor                   nil
          treemacs-show-hidden-files             t
          treemacs-silent-filewatch              nil
          treemacs-silent-refresh                nil
          treemacs-sorting                       'alphabetic-asc
          treemacs-space-between-root-nodes      t
          treemacs-tag-follow-cleanup            t
          treemacs-tag-follow-delay              1.5
          treemacs-user-mode-line-format         nil
          treemacs-user-header-line-format       nil
          treemacs-width                         20
          treemacs-workspace-switch-cleanup      nil)

    ;; The default width and height of the icons is 22 pixels. If you are
    ;; using a Hi-DPI display, uncomment this to double the icon size.
    ;;(treemacs-resize-icons 44)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode 'always)
    (pcase (cons (not (null (executable-find "git")))
                 (not (null treemacs-python-executable)))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple))))
  )

(use-package treemacs-evil
  :after (treemacs evil)
  :ensure t)

(use-package treemacs-projectile
  :after (treemacs projectile)
  :ensure t)

(use-package treemacs-icons-dired
  :after (treemacs dired)
  :ensure t
  :config (treemacs-icons-dired-mode))

(use-package treemacs-magit
  :ensure t)

(use-package lsp-treemacs
  :ensure t
  :after treemacs
  :commands lsp-treemacs-errors-list
  :config
  (lsp-treemacs-sync-mode 1))


(use-package lsp-haskell
  :ensure t
  :config
  (add-hook 'haskell-mode-hook #'lsp)
  (add-hook 'haskell-literate-mode-hook #'lsp)
  )

(use-package lsp-pyright
  :ensure t
  :init (setq lsp-pyright-venv-path (concat default-directory "venv/"))
  :config
  (setq lsp-pyright-diagnostic-mode 1
        lsp-enable-file-watchers  nil
        lsp-file-watch-threshold 100
        )
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp))))  ; or lsp-deferred

(use-package cmake-mode
  :ensure t
  :config
  (cmake-mode))
