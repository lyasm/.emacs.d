;; Custom stuff
(setq default-frame-alist '(
                            (background-color . "#211F2F")))

(setq custom-file "~/.emacs.d/data/data_custom/custom-file.el")
(load-file custom-file)

(add-to-list 'custom-theme-load-path "~/.emacs.d/ui/pinerose-emacs/")
0;(load-theme 'everforest-hard-dark t)
(setq gc-cons-threshold 63000000
      gc-cons-percentage 0.6)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(hl-line-mode t)
