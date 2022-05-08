(require 'package)

(defvar my-packages
  '(treemacs
    treemacs-evil
    treemacs-magit))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;(require 'treemacs)
;(require 'treemacs-evil)
;(require 'treemacs-magit)

