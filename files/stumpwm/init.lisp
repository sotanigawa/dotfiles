(in-package :stumpwm)

(setq *message-window-gravity* :center
      *input-window-gravity* :center
      *window-border-style* :thin
      *mouse-focus-policy* :click
      *startup-message* nil)

(undefine-key *root-map* (kbd "h"))
(undefine-key *group-root-map* (kbd "k"))
(undefine-key *group-root-map* (kbd "C-k"))
(undefine-key *group-root-map* (kbd "K"))
(undefine-key *tile-group-root-map* (kbd "f"))
(define-key *root-map* (kbd "c") "exec alacritty")
(define-key *root-map* (kbd "d") "exec dmenu_run")
(define-key *group-root-map* (kbd "f") "fullscreen")
(define-key *tile-group-root-map* (kbd "h") "move-focus left")
(define-key *tile-group-root-map* (kbd "j") "move-focus down")
(define-key *tile-group-root-map* (kbd "k") "move-focus up")
(define-key *tile-group-root-map* (kbd "l") "move-focus right")
(define-key *tile-group-root-map* (kbd "C-h") "move-window left")
(define-key *tile-group-root-map* (kbd "C-j") "move-window down")
(define-key *tile-group-root-map* (kbd "C-k") "move-window up")
(define-key *tile-group-root-map* (kbd "C-l") "move-window right")
(define-key *input-map* (kbd "C-m") 'input-submit)
(define-key *input-map* (kbd "C-h") 'input-delete-backward-char)

(set-font "-*-terminus-medium-*-*--14-*-*-*-*-*-*-*")

(load (merge-pathnames #P"init-local.lisp" *data-dir*) :if-does-not-exist nil)
