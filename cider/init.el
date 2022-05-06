;; Cider overrides

(defvar my-packages
  '(cider))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(require 'cider)


(define-key cider-test-report-mode-map (kbd "C-c C-t C-j")
                         'cider-test-jump)

(define-key cider-test-report-mode-map (kbd "C-c C-t C-d")
                         'cider-test-ediff)

(define-key cider-test-report-mode-map (kbd "C-c C-t C-e")
                         'cider-test-stacktrace)

;; Show tests on success as well because it is very anoying when you kill report buffer and it does not pop up
(setq cider-test-show-report-on-success t)



