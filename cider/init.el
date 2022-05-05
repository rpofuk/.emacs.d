;; Cider overrides

(defvar my-packages
  '(cider))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(require 'cider)


(define-key cider-test-report-mode-map (kbd "C-j")
                         'cider-test-jump)


