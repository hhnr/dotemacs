;;; init-interface.el --- Enable or disable several interface components

;; Copyright (C) 2015 Mathieu Marques

;; Author: Mathieu Marques <mathieumarques78@gmail.com>
;; Created: 16 May 2015
;; Homepage: https://bitbucket.org/angrybacon/dotemacs

;;; Code:


;;=============================================================================
;; Configure interface components
;;=============================================================================


;; Goodies
(global-subword-mode 1)                          ; Iterate through CamelCase words
(mouse-avoidance-mode 'animate)                  ; Move pointer when point reaches cursor location


;;=============================================================================
;; Define helpers
;;=============================================================================


(defadvice dired-readin (after dired-after-updating-hook first () activate)
  "List directories first in `diared-mode'."
  (save-excursion
    (let (buffer-read-only)
      (forward-line 2)
      (sort-regexp-fields t "^.*$" "[ ]*." (point) (point-max)))
    (set-buffer-modified-p nil)))


(add-hook 'prog-mode-hook 'me/highlight-hex-strings)
(defun me/highlight-hex-strings ()
  "Find and highlight hexadecimal color strings with a colored background."
  (interactive)
  (font-lock-add-keywords nil
   '(("#[abcdefABCDEF[:digit:]]\\{6\\}"
      (0 (put-text-property
          (match-beginning 0)
          (match-end 0)
          'face (list :background (match-string-no-properties 0)))))))
  (font-lock-fontify-buffer))


;;=============================================================================
;; Configure Uniquify
;;=============================================================================


;; Built-in
(use-package uniquify
  :ensure nil
  :config (setq-default uniquify-buffer-name-style 'forward))



(provide 'init-interface)
;;; init-interface.el ends here
