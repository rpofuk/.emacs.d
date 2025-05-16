(use-package csv-mode 
  :ensure t
  :config (setq csv-separators '("|")))

(use-package yaml-mode
  :ensure t)

(use-package go-mode 
  :ensure t)

(require 'lsp-mode)
(add-hook 'go-mode-hook #'lsp-deferred)


;; Set up before-save hooks to format buffer and add/delete imports.
;; Make sure you don't have other gofmt/goimports hooks enabled.
(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)


(use-package pyvenv
  :ensure t
  :config
  (pyvenv-mode t)

  ;; Set correct Python interpreter
  (setq pyvenv-post-activate-hooks
        (list (lambda ()
                (setq python-shell-interpreter (concat pyvenv-virtual-env "bin/python3")))))
  (setq pyvenv-post-deactivate-hooks
        (list (lambda ()
                (setq python-shell-interpreter "python3")))))

(add-hook 'python-mode-hook 'lsp-deferred)
(setq lsp-pylsp-plugins-black-enabled 't)


(use-package envrc
  :ensure t)

(use-package groovy-mode
  :ensure t 
)

(require 'lsp-groovy)
(setq lsp-groovy-server-file "~/lkw/groovy-language-server/build/libs/groovy-language-server-all.jar")
(add-hook 'groovy-mode-hook 'lsp)
(add-to-list 'auto-mode-alist '("Jenkinsfile\\'" . groovy-mode))




