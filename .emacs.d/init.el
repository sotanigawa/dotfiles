(setq inhibit-startup-message t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-linum-mode 1)
(line-number-mode 1)
(column-number-mode 1)

;;; Behavior
(setq confirm-kill-emacs 'y-or-n-p)
(setq use-dialog-box nil)
(setq load-prefer-newer t)
(setq vc-follow-symlinks t)
(setq-default indent-tabs-mode nil)
(setq
 mouse-wheel-scroll-amount '(2 ((shift) . 4) ((control)))
 mouse-wheel-progressive-speed nil)
(setq scroll-preserve-screen-position 'always)

;;; Visual
(setq-default line-spacing 1)
(setq-default show-trailing-whitespace t)
(global-hl-line-mode t)
(show-paren-mode t)
(use-package highlight-indent-guides
  :hook
  ((prog-mode yaml-mode) . highlight-indent-guides-mode)
  :custom
  (highlight-indent-guides-auto-enabled t)
  (highlight-indent-guides-responsive t)
  (highlight-indent-guides-method 'character))

;;; Paths
(setq backup-directory-alist
      `((".*" . ,(expand-file-name (locate-user-emacs-file "var/backup")))))
(setq auto-save-file-name-transforms
      `((".*" ,(expand-file-name (locate-user-emacs-file "var/backup/")) t)))
(setq auto-save-list-file-prefix
      (locate-user-emacs-file "var/auto-save-list/.saves-"))
(setq custom-file (expand-file-name (locate-user-emacs-file "var/custom.el")))

;;; Keymaps
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "M-?") 'help-for-help)
(global-set-key (kbd "C-c h") 'windmove-left)
(global-set-key (kbd "C-c j") 'windmove-down)
(global-set-key (kbd "C-c k") 'windmove-up)
(global-set-key (kbd "C-c l") 'windmove-right)

;;; Package system
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(package-initialize)

;;; Helm
(helm-mode 1)
(setq recentf-save-file (locate-user-emacs-file "var/helm/.recentf"))
(setq recentf-max-saved-items 1000)
(define-key global-map (kbd "C-x b")   'helm-for-files)
(define-key global-map (kbd "C-x C-f") 'helm-find-files)
(define-key global-map (kbd "C-x C-r") 'helm-recentf)
(define-key global-map (kbd "M-x") 'helm-M-x)
(define-key global-map (kbd "M-y") 'helm-show-kill-ring)
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-h") 'delete-backward-char)

;;; Init loader
(setq init-loader-show-log-after-init 'error-only)
(init-loader-load (locate-user-emacs-file "inits"))

;;; Custom file
(when (file-exists-p custom-file) (load custom-file))
