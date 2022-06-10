#!/bin/bash

rm -rf .dap-breakpoints
rm -rf .lsp-session-v1
rm -rf .cache

bash -c 'rm -rfv !("init.el"|"custom"|"clean.sh"|"rpofuk.el")'


