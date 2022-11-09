#!/bin/bash

rm -rf .dap-breakpoints
rm -rf .lsp-session-v1
rm -rf .cache

ls -a | grep -vE 'init.el$|custom$|clean.sh$|rpofuk.el$|environment.el$|install.sh$|\.$|^.git.*' | xargs -I {} rm -rf  {}


