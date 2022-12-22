#!/bin/bash

rm -rf .dap-breakpoints
rm -rf .lsp-session-v1
rm -rf .cache

ls -a | grep -vE '.el$|custom$|run.sh$|setup.sh|clean.sh$|environment.el$|install.sh$|\.$|^.git.*' | xargs -I {} rm -rf  {}


echo '(load-file "~/.emacs.d/custom/init.el")' > init.el
