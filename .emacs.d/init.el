;;; Variables
(setq inhibit-startup-message t)
(setq confirm-kill-emacs 'y-or-n-p)
(setq use-dialog-box nil)
(setq load-prefer-newer t)
(setq vc-follow-symlinks t)
(setq mouse-wheel-scroll-amount '(2 ((shift) . 4) ((control))))
(setq mouse-wheel-progressive-speed nil)
(setq scroll-preserve-screen-position 'always)
(setq-default line-spacing 1)
(setq-default indent-tabs-mode nil)
(setq-default show-trailing-whitespace t)
(setq backup-directory-alist
      `((".*" . ,(locate-user-emacs-file "var/backup"))))
(setq auto-save-file-name-transforms
      `((".*" ,(locate-user-emacs-file "var/backup/") t)))
(setq auto-save-list-file-prefix
      (locate-user-emacs-file "var/auto-save-list/.saves-"))
(setq custom-file (locate-user-emacs-file "var/custom.el"))
(when (file-exists-p custom-file) (load custom-file))

;;; Modes
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(line-number-mode 1)
(column-number-mode 1)
(global-linum-mode 1)
(global-hl-line-mode 1)
(show-paren-mode 1)

;;; Keymaps
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "M-?") 'help-for-help)
(global-set-key (kbd "C-c h") 'windmove-left)
(global-set-key (kbd "C-c j") 'windmove-down)
(global-set-key (kbd "C-c k") 'windmove-up)
(global-set-key (kbd "C-c l") 'windmove-right)

;;; Package System
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(package-initialize)
(defvar my/packages '(helm init-loader))
(dolist (package my/packages)
  (unless (package-installed-p package)
    (package-install package)))

;;; Helm
(setq recentf-save-file (locate-user-emacs-file "var/helm/.recentf"))
(setq recentf-max-saved-items 1000)
(helm-mode 1)
(define-key global-map (kbd "C-x b")   'helm-for-files)
(define-key global-map (kbd "C-x C-f") 'helm-find-files)
(define-key global-map (kbd "C-x C-r") 'helm-recentf)
(define-key global-map (kbd "M-x") 'helm-M-x)
(define-key global-map (kbd "M-y") 'helm-show-kill-ring)
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-h") 'delete-backward-char)

;;; Init-Loader
(setq init-loader-show-log-after-init 'error-only)
(init-loader-load (locate-user-emacs-file "inits"))
