;; -*- lexical-binding: t; -*-
(use-package lsp-pyright
  :ensure t
  :defer t
  :custom (lsp-pyright-langserver-command "pyright") ;; or basedpyright
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp)(blacken-mode))))  ; or lsp-deferred

(use-package python-mode
  :ensure t
  :defer t
  )

(use-package blacken
  :ensure t
  :defer t)

