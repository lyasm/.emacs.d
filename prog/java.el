;; -*- lexical-binding: t; -*-
(use-package lsp-java
  :ensure t
  :defer t
  :config )


(add-to-list 'auto-mode-alist '("\\.java\\'" . java-mode))

(add-hook 'java-mode 'lsp)

(defun set-java-compile-command ()
(let ((filename (file-name-sans-extension (file-name-nondirectory buffer-file-name))))
    (set (make-local-variable 'compile-command)
         (concat "javac " filename ".java"))))

(add-hook 'java-mode-hook 'set-java-compile-command)
