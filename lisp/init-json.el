(require 'use-package)


;; https://github.com/gongo/json-reformat
(use-package json-mode
  :ensure t
  :delight json-mode "JSON"
  :init
  (setq
   ;; NOTE: This will be fixed with https://github.com/joshwnj/json-mode/issues/32.
   auto-mode-alist (cons '("\\.jason$" . json-mode) auto-mode-alist)
   auto-mode-alist (cons '("\\.jshintrc$" . json-mode) auto-mode-alist)
   auto-mode-alist (cons '("\\.json$" . json-mode) auto-mode-alist)
   json-reformat:indent-width 2))


(provide 'init-json)
