(use-package kanagawa-themes
  :init
  (load-theme 'kanagawa-wave t))

(use-package ace-window
  :bind
  ("M-o" . ace-window))

(use-package avy
  :bind
  ("C-;" . avy-goto-line)
  ("C-'" . avy-goto-char))

(use-package orderless
  :init
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))

(use-package vertico
  :init
  (vertico-mode))

(use-package expand-region
  :bind ("C-=" . er/expand-region))

(use-package zig-mode
  :hook (zig-mode . lsp-deferred))

(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook (
         (zig-mode . lsp-deferred)
  :commands lsp lsp-deferred)
  :config
  (setq lsp-headerline-breadcrumb-enable nil)
  (setq lsp-completion-provider :none))

(use-package corfu
  :init
  (global-corfu-mode))

(use-package flycheck
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode))

(use-package projectile
  :init
  (projectile-mode +1)
  :config
  (setq projectile-completion-system 'default)
  (setq projectile-project-search-path '("~/projects/" "~/code/"))
  (setq projectile-enable-caching t)
  (setq projectile-cleanup-known-projects nil)
  :bind
  ("C-c p" . projectile-command-map))

(use-package magit
  :bind ("C-x g" . magit-status))

(use-package diff-hl
  :hook ((prog-mode . diff-hl-mode)
         (text-mode . diff-hl-mode)
         (dired-mode . diff-hl-dired-mode))
  :config
  (diff-hl-flydiff-mode)
  (with-eval-after-load 'magit
  (add-hook 'magit-post-refresh-hook #'diff-hl-magit-post-refresh)))
