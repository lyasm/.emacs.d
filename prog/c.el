;; -*- lexical-binding: t; -*-
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-hook 'compilation-filter-hook 'ansi-color-for-comint-mode-on)
(add-to-list 'comint-output-filter-functions 'ansi-color-process-output)
(setq c-default-style "linux")
(add-hook 'c-mode-hook #'c-toggle-hungry-state)
(add-hook 'c-mode-hook 'lsp)
(add-hook 'c++-mode-hook 'lsp)
(add-hook 'c-mode-hook (setq lsp-enable-on-type-formatting nil))
