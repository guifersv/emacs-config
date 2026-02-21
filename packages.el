(use-package kanagawa-themes
  :config
  (load-theme 'kanagawa-wave t))

(use-package ace-window
  :bind ("M-o" . ace-window))

(use-package avy
  :bind (("C-;" . avy-goto-line)
         ("C-'" . avy-goto-char)))

(use-package vertico
  :init
  (vertico-mode))

(use-package savehist
  :init
  (savehist-mode))

(use-package orderless
  :init
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides
        '((file (styles partial-completion)))))

(use-package corfu
  :init
  (global-corfu-mode)
  :config
  (setq corfu-auto t
        corfu-cycle t))

(use-package expand-region
  :bind ("C-=" . er/expand-region))

(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook ((zig-mode . lsp-deferred))
  :commands (lsp lsp-deferred)
  :config
  (setq lsp-headerline-breadcrumb-enable nil
        lsp-completion-provider :none))

(use-package zig-mode
  :mode "\\.zig\\'"
  :hook (zig-mode . lsp-deferred))

;; (use-package flycheck
;;   :init (global-flycheck-mode))
;; (setq lsp-diagnostics-provider :flycheck)

(use-package projectile
  :init
  (projectile-mode +1)
  :config
  (setq projectile-completion-system 'default
        projectile-project-search-path '("~/projects/" "~/code/")
        projectile-enable-caching t
        projectile-cleanup-known-projects nil)
  :bind ("C-c p" . projectile-command-map))

(use-package magit
  :bind ("C-x g" . magit-status))

(use-package diff-hl
  :hook ((prog-mode . diff-hl-mode)
         (text-mode . diff-hl-mode)
         (dired-mode . diff-hl-dired-mode))
  :config
  (diff-hl-flydiff-mode)
  (with-eval-after-load 'magit
    (add-hook 'magit-post-refresh-hook
              #'diff-hl-magit-post-refresh)))

(use-package god-mode
  :init
  (global-set-key (kbd "<escape>") #'god-mode-all)
  :config
  (setq god-mode-enable-function-key-translation nil))

(use-package multiple-cursors
  :bind (("C-S-c C-S-c" . mc/edit-lines)
         ("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C-c C-<" . mc/mark-all-like-this)))

(use-package move-text
  :config
  (move-text-default-bindings))

(use-package smartparens
  :hook ((prog-mode . smartparens-mode)
         (minibuffer-setup . smartparens-mode))
  :config
  (require 'smartparens-config)
  (setq sp-highlight-pair-overlay nil
        sp-highlight-wrap-overlay nil
        sp-highlight-wrap-tag-overlay nil)
  (define-key smartparens-mode-map (kbd "C-M-f") #'sp-forward-sexp)
  (define-key smartparens-mode-map (kbd "C-M-b") #'sp-backward-sexp)
  (define-key smartparens-mode-map (kbd "C-M-d") #'sp-down-sexp)
  (define-key smartparens-mode-map (kbd "C-M-u") #'sp-up-sexp)
  (define-key smartparens-mode-map (kbd "C-M-k") #'sp-kill-sexp))
