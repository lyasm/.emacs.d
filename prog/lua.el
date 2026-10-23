;; -*- lexical-binding: t; -*-
(use-package flymake-lua
  :ensure t)
(use-package company-lua
  :ensure t)

(use-package lua-mode
  :ensure t)

(add-hook 'lua-mode-hook 'lsp)
