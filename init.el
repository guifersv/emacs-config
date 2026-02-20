(require 'package)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("nongnu" . "https://elpa.nongnu.org/nongnu/") t)
(package-initialize)

(require 'use-package-ensure)
(setq use-package-always-ensure t)
(setq use-package-always-defer t)
(use-package auto-compile
  :demand t
  :config (auto-compile-on-load-mode))
(setq load-prefer-newer t)
(setq byte-compile-warnings '(cl-functions))
(setq warning-minimum-level :emergency)

(setq custom-file "./custom.el")
(load custom-file)
(setq visible-bell nil)
(setq scroll-conservatively 100)
(setq frame-inhibit-implied-resize t)
(setq backup-directory-alist `(("." . "~/.emacs.d/backups")))
(setq inhibit-startup-message t)
(setq indent-tabs-mode nil)
(setq tab-width 4)
(setq display-line-numbers-type 'relative)
(setq use-short-answers t)

(menu-bar-mode 0)
(show-paren-mode 1)
(tool-bar-mode 0)
(scroll-bar-mode -1)
(global-hl-line-mode 1)
(pixel-scroll-precision-mode 1)
(set-window-scroll-bars (minibuffer-window) nil nil)
(global-display-line-numbers-mode)

(defvar +font-size-fixed 100)
(defvar +font-size-variable 120)

(set-face-attribute 'default nil
                    :family "CaskaydiaCove Nerd Font"
                    :height +font-size-fixed)

(set-face-attribute 'fixed-pitch nil
                    :family "CaskaydiaCove Nerd Font"
                    :height +font-size-fixed)

(set-face-attribute 'variable-pitch nil
                    :family "CaskaydiaCove Nerd Font"
                    :height +font-size-variable)

(use-package default-text-scale
  :bind
  (("C-)" . default-text-scale-reset)
   ("C-=" . default-text-scale-increase)
   ("C--" . default-text-scale-decrease)))

(defun +kill-current-buffer ()
  "Kill the current buffer without prompting."
  (interactive)
  (kill-buffer (current-buffer)))

(global-set-key (kbd "C-x k") '+kill-current-buffer)

(load (expand-file-name "packages.el" user-emacs-directory))
