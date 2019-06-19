(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq display-time-format "[%H:%M]")
(display-time-mode t)
(setq use-file-dialog nil)
(setq use-dialog-box nil)
(fboundp 'toggle-frame-fullscreen)
;; Command-Option-f to toggle fullscreen mode
;; Hint: Customize `ns-use-native-fullscreen'
(global-set-key (kbd "M-ƒ") 'toggle-frame-fullscreen)
(setq initial-frame-alist '((top . 0) (left . 0) (width . 180) (height . 70)))
(set-face-attribute 'default nil :height 100)
(set-face-attribute 'default nil :family "Monaco")

(global-set-key (kbd "M-h") 'ns-do-hide-emacs)
(global-set-key (kbd "M-˙") 'ns-do-hide-others)

(setq solarized-scale-org-headlines nil)
(setq solarized-high-contrast-mode-line t)
(setq solarized-use-variable-pitch t)
(load-theme 'darktooth t)

(global-set-key (kbd "C-x w l") 'window-jump-right)
(global-set-key (kbd "C-x w h") 'window-jump-left)
(global-set-key (kbd "C-x w j") 'window-jump-down)
(global-set-key (kbd "C-x w k") 'window-jump-up)

;; function to allow for alternating between horizontal and vertical splits
;; Source: https://www.emacswiki.org/emacs/ToggleWindowSplit
(defun toggle-window-split ()
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
	     (next-win-buffer (window-buffer (next-window)))
	     (this-win-edges (window-edges (selected-window)))
	     (next-win-edges (window-edges (next-window)))
	     (this-win-2nd (not (and (<= (car this-win-edges)
					 (car next-win-edges))
				     (<= (cadr this-win-edges)
					 (cadr next-win-edges)))))
	     (splitter
	      (if (= (car this-win-edges)
		     (car (window-edges (next-window))))
		  'split-window-horizontally
		'split-window-vertically)))
	(delete-other-windows)
	(let ((first-win (selected-window)))
	  (funcall splitter)
	  (if this-win-2nd (other-window 1))
	  (set-window-buffer (selected-window) this-win-buffer)
	  (set-window-buffer (next-window) next-win-buffer)
	  (select-window first-win)
	  (if this-win-2nd (other-window 1))))))

(global-set-key (kbd "C-x |") 'toggle-window-split)

(setq calendar-location-name "Liverpool, UK") 
(setq calendar-latitude 53.36)
(setq calendar-longitude -2.91)

;; (require 'theme-changer)
;; (change-theme 'solarized-light 'solarized-dark)

(provide 'init-frame)
