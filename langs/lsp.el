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
		 (powershell-mode . lsp)
         (before-save-hook . lsp-format-buffer)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :config
	(add-hook 'go-mode-hook #'lsp-deferred)
  (setq lsp-print-performance t
        lsp-headerline-breadcrumb-enable t
        lsp-idle-delay 0.1
        lsp-prefer-capf t
        lsp-signature-auto-activate nil
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
