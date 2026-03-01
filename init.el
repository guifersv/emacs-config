(add-to-list 'exec-path (expand-file-name "~/.local/share/nvim/mason/bin"))
(setenv "PATH"
        (concat "~/.local/share/nvim/mason/bin:" (getenv "PATH")))

(defun my-minibuffer-setup-hook ()
  (setq gc-cons-threshold most-positive-fixnum))

(defun my-minibuffer-exit-hook ()
  (setq gc-cons-threshold 800000000))

(setq gc-cons-threshold most-positive-fixnum)

(run-with-idle-timer 1.2 t 'garbage-collect)

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)
(setq straight-use-package-by-default t)

(setq load-prefer-newer t
      byte-compile-warnings '(cl-functions)
      warning-minimum-level :emergency
      mouse-drag-copy-region t)

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
      backup-directory-alist
      `(("." . ,(expand-file-name "backups" user-emacs-directory))))

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(pixel-scroll-precision-mode -1)

(show-paren-mode 1)
(global-hl-line-mode 1)
(electric-indent-mode 1)
(delete-selection-mode 1)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)

(set-face-attribute 'default nil :family "CaskaydiaCove Nerd Font" :height 100)
(set-face-attribute 'fixed-pitch nil :family "CaskaydiaCove Nerd Font" :height 100)
(set-face-attribute 'variable-pitch nil :family "CaskaydiaCove Nerd Font" :height 120)

(use-package auto-compile
  :demand t
  :config
  (auto-compile-on-load-mode))

(use-package default-text-scale
  :bind (("C-)" . default-text-scale-reset)
         ("C-M-+" . default-text-scale-increase)
         ("C-M-=" . default-text-scale-decrease)))

(defun +kill-current-buffer ()
  (interactive)
  (kill-buffer (current-buffer)))

(global-set-key (kbd "C-x k") #'+kill-current-buffer)

; (defun my/run-zig (cmd)
;   (interactive)
;   (split-window-below)
;   (other-window 1)
;   (ansi-term "/bin/zsh")
;   (term-send-raw-string (concat cmd "\n")))
;
; (defun my/zig-run ()
;   (interactive)
;   (my/run-zig "zig build run"))
;
; (defun my/zig-test ()
;   (interactive)
;   (my/run-zig "zig build test"))
;
; (global-set-key (kbd "C-c z r") #'my/zig-run)
; (global-set-key (kbd "C-c z t") #'my/zig-test)

(defun my/zig-run ()
  (interactive)
  (compile "zig build run"))

(defun my/zig-test ()
  (interactive)
  (compile "zig build test"))

(global-set-key (kbd "C-c z r") #'my/zig-run)
(global-set-key (kbd "C-c z t") #'my/zig-test)

(let ((pkg-file (expand-file-name "packages.el" user-emacs-directory)))
  (when (file-exists-p pkg-file)
    (load pkg-file)))
