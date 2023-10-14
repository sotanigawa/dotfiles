;;; Variables
(setq inhibit-startup-message t)
(setq confirm-kill-emacs 'y-or-n-p)
(setq use-dialog-box nil)
(setq load-prefer-newer t)
(setq vc-follow-symlinks t)
(setq mouse-wheel-scroll-amount '(2 ((shift) . 4) ((control))))
(setq mouse-wheel-progressive-speed nil)
(setq scroll-preserve-screen-position 'always)
(setq-default show-trailing-whitespace t)
(setq-default indent-tabs-mode nil)
(setq recentf-save-file (locate-user-emacs-file "share/.recentf"))
(setq recentf-max-saved-items 1000)
(setq backup-directory-alist
      `((".*" . ,(locate-user-emacs-file "temp/backups/"))))
(setq auto-save-file-name-transforms
      `((".*" ,(locate-user-emacs-file "temp/auto-saves/") t)))
(setq auto-save-list-file-prefix
      (locate-user-emacs-file "temp/auto-saves/.saves-"))
(setq custom-file (locate-user-emacs-file "custom.el"))
(when (file-exists-p custom-file) (load custom-file))
(setq desktop-path (list (locate-user-emacs-file "share/")))

;;; Modes
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(line-number-mode 1)
(column-number-mode 1)
(global-display-line-numbers-mode 1)
(global-hl-line-mode 1)
(show-paren-mode 1)
(desktop-save-mode 1)

;;; Keymaps
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "M-?") 'help-for-help)
(global-set-key (kbd "C-c h") 'windmove-left)
(global-set-key (kbd "C-c j") 'windmove-down)
(global-set-key (kbd "C-c k") 'windmove-up)
(global-set-key (kbd "C-c l") 'windmove-right)

;;; Package System
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
(package-initialize)
(dolist (package '(helm ddskk use-package doom-themes init-loader))
  (unless (package-installed-p package) (package-install package)))

;;; Helm
(helm-mode 1)
(global-set-key (kbd "C-x b") 'helm-for-files)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x C-r") 'helm-recentf)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-h") 'delete-backward-char)

;;; DDSKK
(setq skk-user-directory (locate-user-emacs-file "share/ddskk/"))
(setq skk-large-jisyo "/usr/share/skk/SKK-JISYO.L")
(setq skk-dcomp-activate t)
(setq skk-cursor-hiragana-color "pink")
(global-set-key (kbd "C-x j") 'skk-mode)
(defun skk-isearch-setup-maybe ()
  (require 'skk-vars)
  (when (or (eq skk-isearch-mode-enable 'always)
            (and (boundp 'skk-mode)
                 skk-mode
                 skk-isearch-mode-enable))
    (skk-isearch-mode-setup)))
(defun skk-isearch-cleanup-maybe ()
  (require 'skk-vars)
  (when (and (featurep 'skk-isearch)
             skk-isearch-mode-enable)
    (skk-isearch-mode-cleanup)))
(add-hook 'isearch-mode-hook #'skk-isearch-setup-maybe)
(add-hook 'isearch-mode-end-hook #'skk-isearch-cleanup-maybe)

;;; Doom-Themes
(use-package doom-themes
  :custom
  (doom-themes-enable-italic t)
  (doom-themes-enable-bold t)
  :config
  (load-theme 'doom-dracula t))

;;; Font
(add-to-list 'default-frame-alist '(font . "RictyDiscord-14"))

;;; Init-Loader
(let ((inits (locate-user-emacs-file "inits/")))
  (when (file-directory-p inits)
    (setq init-loader-show-log-after-init 'error-only)
    (init-loader-load inits)))
