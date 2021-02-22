(use-package counsel
  :ensure t)

(use-package ivy
 :ensure t
 :bind (("C-x b" . ivy-switch-buffer)
         ("C-x B" . ivy-switch-buffer-other-window)
         ("M-H"   . ivy-resume))
 :config
(setq ivy-use-virtual-buffers t)
(setq ivy-virtual-abbreviate 'full) ;Show the full virtual file paths
(setq ivy-extra-directories nil)    ;Default value: ("../" "./")
(setq ivy-count-format "(%d/%d) ")
 (ivy-mode 1)
 )

(use-package all-the-icons-ivy
  :ensure t
  :after ivy)


(use-package all-the-icons-ivy-rich
 :ensure t
 :init (all-the-icons-ivy-rich-mode 1))

(use-package smex
  :ensure t
  :after counsel
  :config
  (smex-initialize)
)

(use-package ivy-rich
  :ensure t
  :after (ivy)
  :init
  (setq ivy-rich-path-style 'abbrev
        ivy-virtual-abbreviate 'full)
  )
 :config
  (ivy-rich-modify-column 'ivy-switch-buffer
                          'ivy-rich-switch-buffer-major-mode
                          '(:width 20 :face error))
    (ivy-rich-mode 1)

(use-package swiper
  :after ivy
  :ensure t)
