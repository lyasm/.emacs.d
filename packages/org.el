(use-package org-modern
  :ensure t
  :hook
  (org-mode . org-modern-mode))
(add-hook 'org-mode-hook #'turn-on-flyspell)
query-replace-history
(setq org-preview-latex-default-process 'imagemagick)

;; bigger latex

(with-eval-after-load 'org
  (add-to-list 'org-latex-packages-alist '("" "chemfig" t) )
  )

