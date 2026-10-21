;; -*- lexical-binding: t; -*-
(set-default-toplevel-value 'lexical-binding t)
;;charset
(set-charset-priority 'unicode)
(prefer-coding-system 'utf-8-unix)

(setq native-comp-jit-compilation t
      native-comp-async-report-warnings-errors nil)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; (package-initialize)

(add-hook 'emacs-startup-hook
	  (lambda ()
	    (load-theme 'rose-pine t)
	    (modify-all-frames-parameters
	     '((right-divider-width . 5)
	       (internal-border-width . 5)))
	    ;; (set-frame-parameter nil 'alpha-background 80)
	    (global-visual-line-mode t)
	    (global-hl-line-mode t)
	    ))

(use-package  benchmark-init
  :ensure t
  :config
  (benchmark-init/activate))

(add-hook 'after-init-hook 'benchmark-init/deactivate)

(use-package use-package-core
  :custom
  ;; (use-package-verbose t
  ;; (use-package-minimum-reported-time 0.005)
  (use-package-enable-imenu-support t))
(setq use-package-compute-statistics t)

;; (modify-all-frames-parameters
;;  '((right-divider-width . 5)
;;    (internal-border-width . 5)))
;; (set-frame-parameter nil 'alpha-background 80)
;; (global-visual-line-mode t)
(blink-cursor-mode -1)

(setq backup-directory-alist
      `(("." . ,(concat user-emacs-directory "backups"))))
(setq auto-save-file-name-transforms
      `((".*" ,(concat user-emacs-directory "backups"))))

(use-package diminish
  :ensure t
  :defer t
  :config
  (diminish 'abbrev-mode)
  (diminish 'helm-mode "h")
  (diminish 'eldoc-mode)
  )

(use-package company
  :ensure t
  :init()
  :defer t
  :bind()
  :diminish (company-mode . "comp")
  :hook ((prog-mode text-mode) . company-mode)
  :config
  (setq company-idle-delay 0.3)
  (add-to-list 'company-backends 'company-files)
  (global-company-mode t))


(use-package all-the-icons
  :ensure t)

;; (use-package centaur-tabs
;;   :ensure t
;;   :config
;;   (set-face-attribute 'centaur-tabs-active-bar-face nil
;; 		      :background "#82BF91")
;;   (set-face-attribute 'centaur-tabs-selected nil
;; 		      :background "#4F5B58")
;;   (set-face-attribute 'centaur-tabs-unselected nil
;; 		      :background "#3D4942")
;;   (centaur-tabs-change-fonts "SpaceMono Nerd Font Mono" 110)
;;   (setq centaur-tabs-style "wave")
;;   (setq centaur-tabs-height 32)
;;   (setq centaur-tabs-set-icons t)
;;   (setq centaur-tabs-plain-icons t)
;;    (setq centaur-tabs-gray-out-icons 'buffer)
;;    (setq centaur-tabs-set-bar 'under)
;;    (setq x-underline-at-descent-line t)
;;    (setq centaur-tabs-set-modified-marker t)
;;    (setq centaur-tabs-modified-marker "󱙄")
;;    (centaur-tabs-headline-match)
;;    (centaur-tabs-mode t))

 (use-package yasnippet
   :ensure t
   :defer t
   :hook
   (prog-mode . yas-minor-mode)
   :diminish yas-minor-mode
   )
 ;;org-mode
 (load-file "~/.emacs.d/packages/org.el")
 ;;helm stuff
 (load-file "~/.emacs.d/packages/helm.el")

 ;; (use-package theme-magic
 ;;   :ensure t
 ;;   :defer 1
 ;;   :diminish
;;   (theme-magic-export-theme-mode))

(use-package ewal
  :defer t
  :init (setq ewal-use-built-in-always-p nil
              ewal-use-built-in-on-failure-p t
              ewal-built-in-palette "oxocarbon"))

;; (use-package ewal-spacemacs-themes
;;   :defer 1
;;   :init (progn
;;           (setq spacemacs-theme-underline-parens t
;;                 my:rice:font (font-spec
;;                               :family "IBM Plex Mono"
;;                               :weight 'normal
;;                               :size 14.0))
;;           (show-paren-mode +1)
;;           (global-hl-line-mode))
;;   :config (progn
;;             (load-theme 'ewal-spacemacs-modern t)
;;             (enable-theme 'ewal-spacemacs-modern)))
;; (use-package ewal-evil-cursors
;;   :after (ewal-spacemacs-themes)
;;   :config (ewal-evil-cursors-get-colors
;;            :apply t :spaceline t))


(use-package treemacs
  :ensure t
  :defer t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (progn
    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode 'always)
    (when treemacs-python-executable
      (treemacs-git-commit-diff-mode t))

    (pcase (cons (not (null (executable-find "git")))
		 (not (null treemacs-python-executable)))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple)))

    (treemacs-hide-gitignored-files-mode nil))
  :bind
  (:map global-map
	("M-0"       . treemacs-select-window)
	("C-x t 1"   . treemacs-delete-other-windows)
	("C-x t t"   . treemacs)
	("C-x t d"   . treemacs-select-directory)
	("C-x t B"   . treemacs-bookmark)
	("C-x t C-t" . treemacs-find-file)
	("C-x t M-t" . treemacs-find-tag))
  )

(use-package treemacs-projectile
  :after (treemacs projectile)
  :ensure t)

(use-package treemacs-icons-dired
  :hook (dired-mode . treemacs-icons-dired-enable-once)
  :ensure t)

(use-package rainbow-mode
  :ensure t
  :hook (prog-mode . rainbow-mode)
  :config
  (rainbow-mode))

(use-package hydra
  :ensure t
  :defer 0.1
  )


(use-package avy
  :ensure t
  :diminish
  :defer nil
  :custom
  (which-key-enable-extended-define-key t)
  :config
  (which-key-mode)
  :hook
  (ivy-mode . avy-modes)
  )

(use-package which-key
  :ensure t
  :defer 0.1
  :custom
  (which-key-enable-extended-define-key t)
  :config
  (which-key-mode)
  :diminish
  )

(setq org-image-actual-width nil)
(use-package dap-mode
  :ensure t
  :defer t
  :hook
  (prog-mode . dap-mode)
  )


(use-package amx
  :ensure t
  :defer 1
  :config
  (amx-mode 1))

 ;; Git integration for Emacs
 (use-package magit
   :ensure t
   :bind ("C-x g" . magit-status))

;; Better handling of paranthesis when writing Lisps.
(use-package paredit
  :ensure t
  :init
  (add-hook 'clojure-mode-hook #'enable-paredit-mode)
  (add-hook 'cider-repl-mode-hook #'enable-paredit-mode)
  (add-hook 'emacs-lisp-mode-hook #'enable-paredit-mode)
  (add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
  (add-hook 'ielm-mode-hook #'enable-paredit-mode)
  (add-hook 'lisp-mode-hook #'enable-paredit-mode)
  (add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
  (add-hook 'scheme-mode-hook #'enable-paredit-mode)
  :config
  (show-paren-mode t)
  :diminish (paredit-mode . "pm")
  :bind (("M-[" . paredit-wrap-square)
	 ("M-{" . paredit-wrap-curly))
  )

;;0.1s (magit + paredit) 1.6s

;;  ;; (use-package cheatsheet
;;  ;; :ensure t) configure someday?

;;  ;; (use-package symbol-overlay
;;  ;;   :ensure t)

(use-package elcord
   :ensure t
   :defer 2
   :config
   (elcord-mode))

(use-package elfeed
  :defer t
  :ensure t
  :commands (elfeed elfeed-update))

(setq elfeed-feeds
      '("https://github.com/jc141x/releases-feed/releases/latest/download/releases.rss"
        "https://planet.emacslife.com/atom.xml"))

;;  ;;prog-stuff
(load-file "~/.emacs.d/prog/prog.el")

;; ;;flyspell
(load-file "~/.emacs.d/packages/flyspell.el")

(use-package flycheck
  :ensure t
  :defer t
  :diminish
  :config
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))
  :hook
  (prog-mode . flycheck-mode))


;; ;;Show file full path in title bar
(setq-default frame-title-format
	      (list '((buffer-file-name " %f"
					(dired-directory
					 dired-directory
					 (revert-buffer-function " %b"
					 			 ("%b - Dir:  " default-directory)))))))

(autoload 'dired-async-mode "dired-async.el" nil t)
(dired-async-mode 1)

(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      treemacs-space-between-root-nodes nil)  ;; clangd is fast

;;keybinds:
(defvar custom-prefix-map (make-sparse-keymap)
  "C-c c")

(keymap-global-set "C-c ;" 'comment-or-uncomment-region)

(load-file "~/.emacs.d/ui/dashboard.el")
(load-file "~/.emacs.d/ui/doomline.el")
