 ;(use-package company
 ; :ensure t 
 ; :config
 ; (setq company-minimum-prefix-length 2)
 ; :hook 
 ; (after-init . global-company-mode))


;; https://github.com/hlissner/doom-emacs/blob/d88e0795b68bd0a261872b2c1e80b7b567a862ae/modules/completion/company/config.el
(use-package company
  :ensure t
  :commands company-complete-common company-manual-begin company-grab-line
  :hook (after-init . global-company-mode)
  :init
  (setq company-minimum-prefix-length 1
        company-require-match 'never
        company-global-modes '(not erc-mode message-mode help-mode gud-mode)
        company-frontends
        '(company-pseudo-tooltip-frontend 
          company-echo-metadata-frontend)

        company-backends '(company-capf)

        company-auto-complete nil
        company-auto-complete-chars nil

        company-dabbrev-other-buffers nil
        company-dabbrev-ignore-case nil
        company-dabbrev-downcase nil
        company-idle-delay 1
        )
  :config
  (add-hook 'company-mode-hook #'evil-normalize-keymaps)
  (eldoc-add-command 'company-complete-selection
                       'company-complete-common
                       'company-abort)
    (add-hook 'evil-normal-state-entry-hook
        (defun +company-abort-h ()
          ;; HACK `company-abort' doesn't no-op if company isn't active; causing
          ;;      unwanted side-effects, like the suppression of messages in the
          ;;      echo-area.
          ;; REVIEW Revisit this to refactor; shouldn't be necessary!
          (when company-candidates
            (company-abort))))
  )

(use-package company-box
  :ensure t
  :hook (company-mode . company-box-mode)
  :config
  (setq company-box-show-single-candidate t
        company-box-max-candidates 50
        company-box-icons-alist 'company-box-icons-all-the-icons
        )
  )

(use-package  yasnippet
 :ensure t
 :config 
 (yas-global-mode 1)
 (setq lsp-enable-snippet t))

(use-package yasnippet-snippets
 :ensure t)
