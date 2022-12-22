;; Do evil stuff

(setq evil-want-keybinding nil)
(defvar evil-packages
  '(paredit
     evil
     evil-collection))

(dolist (p evil-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; We enable paredit 
(add-hook 'clojure-mode-hook #'enable-paredit-mode)

;; Enable evil mode
(require 'evil)

(when (require 'evil-collection nil t)
  (evil-collection-init))

(global-set-key (kbd "M-[") 'insert-pair)
(global-set-key (kbd "M-{") 'insert-pair)
(global-set-key (kbd "M-\"") 'insert-pair)

(evil-mode 1)




