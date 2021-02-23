(use-package company
  :ensure t 
  :config
  (setq company-minimum-prefix-length 1)
  :hook 
  (after-init . global-company-mode))
