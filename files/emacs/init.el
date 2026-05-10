;;; early settings
(setopt custom-file (locate-user-emacs-file "custom.el"))

;;; ui
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(tab-bar-mode 1)
(global-hl-line-mode 1)
(global-display-line-numbers-mode 1)

(setopt
 inhibit-startup-screen t
 use-dialog-box nil
 scroll-preserve-screen-position 'always
 show-trailing-whitespace t
 line-number-mode t
 column-number-mode t
 mouse-wheel-scroll-amount '(2 ((shift) . 4) ((control)))
 mouse-wheel-progressive-speed nil)

;;; fonts and faces
(custom-set-faces
 '(default ((t (:family "UDEV Gothic" :height 120)))))

;;; keymaps
(global-set-key (kbd "C-h")   'delete-backward-char)
(global-set-key (kbd "C-M-p") 'backward-paragraph)
(global-set-key (kbd "C-M-n") 'forward-paragraph)

;;; editing
(setopt
 indent-tabs-mode nil)

;;; files and backups
(setopt
 confirm-kill-emacs 'y-or-n-p
 vc-follow-symlinks nil
 backup-directory-alist          '((".*" . "~/.local/state/emacs/backups/"))
 auto-save-file-name-transforms  '((".*" "~/.local/state/emacs/auto-saves/" t))
 auto-save-list-file-prefix      "~/.local/state/emacs/auto-saves/")

;;; package
(require 'package)
(setopt package-user-dir "~/.local/share/emacs/elpa/")
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(require 'use-package)
(setopt use-package-always-ensure t)

;;; history
(use-package recentf
  :custom
  (recentf-save-file "~/.local/state/emacs/recentf")
  (recentf-keep '(file-remote-p file-readable-p))
  (recentf-max-saved-items 1000)
  (recentf-auto-cleanup 'never)
  :config
  (recentf-mode))

(use-package savehist
  :custom
  (savehist-file "~/.local/state/emacs/history")
  :config
  (savehist-mode))

;;; minibuffer completion
(use-package vertico
  :custom
  (vertico-count 20)
  :config
  (vertico-mode))

(use-package vertico-directory
  :after vertico
  :ensure nil
  :bind
  (:map vertico-map ("C-l" . vertico-directory-up)))

(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides
   '((file (styles basic partial-completion))
     (recentf (styles basic)))))

(use-package marginalia
  :config
  (marginalia-mode))

(use-package consult
  :custom
  (consult-preview-key nil)
  :bind
  ("C-x C-r" . consult-recent-file)
  ("C-x b"   . consult-buffer))

;;; japanese input
(use-package ddskk
  :custom
  (skk-user-directory "~/.local/share/emacs/skk/")
  (skk-large-jisyo "/usr/share/skk/SKK-JISYO.L")
  (skk-cursor-hiragana-color "pink")
  (skk-dcomp-activate t)
  :bind
  ("C-x j" . skk-mode)
  :hook
  (isearch-mode     . skk-isearch-mode-setup)
  (isearch-mode-end . skk-isearch-mode-cleanup))

;;; theme and modeline
(use-package doom-themes
  :custom
  (doom-themes-enable-bold t)
  (doom-themes-enable-italic t)
  :config
  (load-theme 'doom-dracula t))

(use-package doom-modeline
  :custom
  (doom-modeline-icon nil)
  :config
  (doom-modeline-mode))

;;; extra inits
(use-package init-loader
  :custom
  (init-loader-directory (locate-user-emacs-file "inits/"))
  (init-loader-show-log-after-init 'error-only)
  :config
  (when (file-directory-p init-loader-directory)
    (init-loader-load)))
