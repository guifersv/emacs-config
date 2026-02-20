(use-package kanagawa-themes
  :init
  (load-theme 'kanagawa-wave t))

(use-package ace-window)
(global-set-key (kbd "M-o") 'ace-window)

(use-package avy)
(global-set-key (kbd "C-;") 'avy-goto-line)
(global-set-key (kbd "C-'") 'avy-goto-char)

(use-package vertico
  :init
  (vertico-mode))
