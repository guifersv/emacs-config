(setq gc-cons-threshold 100000000)
(add-hook 'emacs-startup-hook
          (lambda () (setq gc-cons-threshold 800000)))

(require 'package)
(setq package-archives '(("gnu"    . "https://elpa.gnu.org/packages/")
                         ("melpa"  . "https://melpa.org/packages/")
                         ("nongnu" . "https://elpa.nongnu.org/nongnu/")))
(package-initialize)

(require 'use-package-ensure)
(setq use-package-always-ensure t)
(setq use-package-always-defer t)
(setq load-prefer-newer t)
(setq byte-compile-warnings '(cl-functions))
(setq warning-minimum-level :emergency)
(setq mouse-drag-copy-region t)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file 'noerror))

(setq visible-bell nil
      auto-save-default nil
      scroll-conservatively 100
      frame-inhibit-implied-resize t
      inhibit-startup-message t
      indent-tabs-mode nil
      tab-width 4
      standard-indent 4
      use-short-answers t
      backup-directory-alist `(("." . ,(expand-file-name "backups" user-emacs-directory))))

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(show-paren-mode 1)
(global-hl-line-mode 1)
(pixel-scroll-precision-mode 1)
(electric-indent-mode 1)
(delete-selection-mode 1)
(global-display-line-numbers-mode 1)

(set-face-attribute 'default nil :family "CaskaydiaCove Nerd Font" :height 100)
(set-face-attribute 'fixed-pitch nil :family "CaskaydiaCove Nerd Font" :height 100)
(set-face-attribute 'variable-pitch nil :family "CaskaydiaCove Nerd Font" :height 120)

(use-package auto-compile
  :demand t
  :config (auto-compile-on-load-mode))

(use-package default-text-scale
  :bind (("C-)" . default-text-scale-reset)
         ("C-M-+" . default-text-scale-increase)
         ("C-M-=" . default-text-scale-decrease)))

(defun +kill-current-buffer ()
  (interactive)
  (kill-buffer (current-buffer)))

(global-set-key (kbd "C-x k") '+kill-current-buffer)

(let ((pkg-file (expand-file-name "packages.el" user-emacs-directory)))
  (when (file-exists-p pkg-file)
    (load pkg-file)))
