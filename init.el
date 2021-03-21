(setq inhibit-startup-message t)
(setq-default indent-tabs-mode nil)

(set-frame-font "JetBrains Mono Medium 22" nil t)
;; Disable tool bar, menu bar, scroll bar.
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
;; Highlight current line.
(global-hl-line-mode t)

;; auto pair
(electric-pair-mode 1)

;; Test
(setq make-backup-files nil)
(setq create-lockfiles nil)

;; Agenda
(setq org-agenda-files '("~/org"))
(setq
    org-superstar-headline-bullets-list '("⁖" "◉" "○" "✸" "✿"))
;; Skip if done
(setq org-agenda-skip-function  '(org-agenda-skip-entry-if 'todo 'done))


;; PUUH DONT TOUCH
(global-display-line-numbers-mode)

;; config custom
;; change custom varible path
(setq custom-file (concat user-emacs-directory "custom-temp.el"))
(load custom-file 'noerror)

(require 'package)
(package-initialize)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/")
             t)
(add-to-list 'package-archives
             '("org" . "https://orgmode.org/elpa/")
             t)


(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(when (not package-archive-contents)
    (package-refresh-contents))


(use-package auto-package-update
   :ensure t
   :config
   (setq auto-package-update-delete-old-versions t
         auto-package-update-interval 4)
   (auto-package-update-maybe))


;; All the icons
(use-package all-the-icons
    :ensure t)

;; Theme
(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-horizon t))


(use-package tree-sitter
	:ensure t
	:config
	(global-tree-sitter-mode)
	(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)
	)

(use-package tree-sitter-langs
	:ensure t)

(use-package yaml-mode
	:ensure t)

;; optional if you want which-key integration
(use-package which-key
    :ensure t
    :config
    (which-key-mode))

(use-package undo-tree
  :ensure t
  :config
  (global-undo-tree-mode))

(use-package evil
  :after undo-tree
 :ensure t
 :config
 (evil-mode 1)
 (define-key evil-insert-state-map (kbd "TAB") 'tab-to-tab-stop)
 (define-key evil-normal-state-map (kbd "TAB") 'counsel-switch-buffer)
 (evil-set-undo-system 'undo-tree))

(use-package magit
  :ensure t
  :config
  (setq magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1)
  (setq magit-completing-read-function 'magit-ido-completing-read)
  (setq magit-diff-refine-hunk t)
  )

(use-package projectile
  :ensure t
  :config
  (projectile-mode))

(use-package rainbow-delimiters
 :ensure t
 :config
 (setq rainbow-delimiters-max-face-count 8)
 :hook
 (prog-mode . rainbow-delimiters-mode))

(use-package doom-modeline
 :ensure t
 :init (doom-modeline-mode 1))

;; History in M-x
(use-package smex
  :ensure t
  :after counsel
  :config
  (smex-initialize))


(use-package dashboard
  :ensure t
  :config
  (setq dashboard-center-content t
        dashboard-set-heading-icons t
        dashboard-set-file-icons t
        dashboard-set-navigator t)

  (setq dashboard-items '((recents  . 5)
                        (projects . 10)
                        (agenda . 5)
                        (bookmarks . 5)
                        (registers . 5)))
  (dashboard-setup-startup-hook))

(load (concat user-emacs-directory "completion/ivy.el"))
(load (concat user-emacs-directory "completion/company.el"))
;; (load (concat user-emacs-directory "completion/company-cmake.el"))
(load (concat user-emacs-directory "langs/lsp.el"))
(load (concat user-emacs-directory "langs/rust.el"))
(load (concat user-emacs-directory "langs/vue.el"))
(load (concat user-emacs-directory "langs/prettier.el"))
(load (concat user-emacs-directory "configs.el"))
(load (concat user-emacs-directory "keybinds/general.el"))
