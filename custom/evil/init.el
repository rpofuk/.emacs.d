;; Do evil stuff
(defvar evil-packages
  '(evil
    evil-collection))

(dolist (p evil-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; Enable evil mode
(setq evil-want-integration t) ;; This is optional since it's already set to t by default.
(setq evil-want-keybinding nil)
(require 'evil)

(when (require 'evil-collection nil t)
  (evil-collection-init))

(evil-mode 1)



