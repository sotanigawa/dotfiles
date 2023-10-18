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
(when (version<= "28" emacs-version) (fido-vertical-mode 1))

;;; Keymaps
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "C-x C-r") 'recentf)

;;; Font
(add-to-list 'default-frame-alist '(font . "RictyDiscord-14"))

;;; Package System
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
(package-initialize)
(unless (package-installed-p 'use-package) (package-install 'use-package))

;;; DDSKK
(use-package ddskk
  :ensure t
  :custom
  (skk-user-directory (locate-user-emacs-file "share/ddskk/"))
  (skk-large-jisyo "/usr/share/skk/SKK-JISYO.L")
  (skk-cursor-hiragana-color "pink")
  (skk-dcomp-activate t)
  :bind
  (("C-x j" . 'skk-mode))
  :hook
  ((isearch-mode . skk-isearch-mode-setup)
   (isearch-mode-end . skk-isearch-mode-cleanup)))

;;; Doom-Themes
(use-package doom-themes
  :ensure t
  :custom
  (doom-themes-enable-bold t)
  (doom-themes-enable-italic t)
  :config
  (load-theme 'doom-dracula t))

;;; Init-Loader
(use-package init-loader
  :ensure t
  :custom
  (init-loader-directory (locate-user-emacs-file "inits/"))
  (init-loader-show-log-after-init 'error-only)
  :config
  (when (file-directory-p init-loader-directory) (init-loader-load)))
