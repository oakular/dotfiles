(require 'elfeed)
(require 'elfeed-org)

(setq elfeed-sort-order 'ascending)

(defun elfeed-face-attr ()
  (interactive)
  (setq buffer-face-mode-face '(:family "Literata" :height 130))
  (buffer-face-mode))

(add-hook 'elfeed-show-mode-hook 'elfeed-face-attr)

(add-hook 'elfeed-new-entry-hook
          (elfeed-make-tagger :before "2 weeks ago"
                              :remove 'unread))

(defun elfeed-today ()
  (interactive)
  (bookmark-maybe-load-default-file)
  (bookmark-jump "elfeed-today"))

(defun elfeed-pcast ()
  (interactive)
  (bookmark-maybe-load-default-file)
  (bookmark-jump "elfeed-pcast"))

(defun elfeed-money ()
  (interactive)
  (bookmark-maybe-load-default-file)
  (bookmark-jump "elfeed-money"))

(define-key elfeed-search-mode-map "t" 'elfeed-today)
(define-key elfeed-search-mode-map "m" 'elfeed-money)
(define-key elfeed-search-mode-map "P" 'elfeed-pcast)

(define-key global-map "\C-ce" 'elfeed)

(elfeed-org)
(setq shr-current-font "Hack")
(setq shr-width 100)

(provide 'init-elfeed)
