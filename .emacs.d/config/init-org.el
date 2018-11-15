(require 'org)
(require 'org-capture)
(require 'org-bibtex)
(require 'org-bullets)
(require 'ob-ledger)
(require 'ob-latex)
(require 'ob-shell)
(require 'ob-swift)
(require 'ob-python)
(require 'olivetti)

(setq org-latex-pdf-process
      '("pdflatex -interaction nonstopmode -output-directory %o %f"
        "biber %b"
        "pdflatex -interaction nonstopmode -output-directory %o %f"
        "pdflatex -interaction nonstopmode -output-directory %o %f"))
(setq org-export-async-init-file "~/.emacs.d/org-async-export-init.el")
(setq org-export-in-background t)

(setq org-tags-column -80)

(add-hook 'org-mode-hook 'org-bullets-mode)
(add-hook 'org-mode-hook 'flyspell-mode)
(add-hook 'org-mode-hook 'auto-fill-mode)

(setq olivetti-body-width 0.75)
(add-hook 'org-mode-hook 'olivetti-mode)

(add-to-list 'org-modules 'org-habit t)
(setq org-habit-show-habits-only-for-today t)

(setq org-startup-indented t)
(setq org-hide-emphasis-markers t)
(setq org-footnotes-auto-adjust t)

(setq org-attach-method "ln")

(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cc" 'org-capture)
(setq org-special-ctrl-a t)

(setq org-directory "~/Documents/org/")
(setq org-mobile-directory "~/Documents/Dropbox/Apps/MobileOrg")
(setq org-mobile-inbox-for-pull "~/Documents/org/refile.org")
(setq org-agenda-files '("~/Documents/org/plan/"
                         "~/Documents/org/refile.org"))
(setq org-agenda-diary-file (concat org-directory "daily-review.org"))

(setq org-archive-location (concat org-directory "archive/%s_archive::"))

(defun org-agenda-face-attr ()
  (interactive)
  (setq buffer-face-mode-face '(:family "Hack" :height 180))
  (buffer-face-mode))

(add-hook 'org-agenda-mode-hook 'org-agenda-face-attr)

(setq org-agenda-nday 7)
(setq org-agenda-window-setup 'only-window)
(setq org-agenda-show-all-dates t)
(setq org-agenda-skip-scheduled-if-done t)
(setq org-deadline-warning-days 3)
(setq org-reverse-note-order t)
(setq org-enforce-todo-dependencies t)
(setq org-agenda-show-future-repeats "next")
(setq org-agenda-use-time-grid nil)
(setq org-agenda-clockreport-parameter-plist '(:link t :maxlevel 4))

;; --- org auditing options
(setq org-log-done t)
(setq org-log-done (quote time))
(setq org-log-redeadline (quote time))
(setq org-log-reschedule (quote time))

;; --- change priorities to quadrant numbers
(setq org-highest-priority 49)
(setq org-lowest-priority 52)
(setq org-default-priority 50)

(setq org-todo-keywords
      '((sequence "TODO(t)" "DOING(o)" "HOLD(h)" "|" "DONE(d!)" "CANCELLED(c)")))

(setq org-default-notes-file (concat org-directory "refile.org"))

(setq org-capture-templates
      (quote (
              ("t" "TODO Item"
               entry (file+headline org-default-notes-file "Tasks")
               "* TODO %?\n %i\n %a")

              ("r" "respond"
               entry (file org-default-notes-file)
               "* Respond to %:from on %:subject\nSCHEDULED: %t\n%U\n%a\n")
              
              ("n" "note"
               entry (file+headline org-default-notes-file "Notes")
               "* NOTE: %?\n%U\n%a\n")

              ("l" "Log"
               entry (file+datetree "~/Documents/projects/uni/yr4/comp39x/log.org")
               (file "~/.emacs.d/org-templates/log.orgtmpl"))

              ("w" "Writing"
               entry (file+datetree "~/Documents/projects/writing/rough/rough.org")
               (file "~/.emacs.d/org-templates/log.orgtmpl"))

              ("j" "Journal"
               entry (file+datetree "~/Documents/org/daily-review.org")
               (file "~/.emacs.d/org-templates/journal.orgtmpl"))

              ("m" "Meeting"
               entry (file+headline org-default-notes-file "Meetings")
               "* MEETING with %? r.e \n%U")

              ("p" "Contact"
               entry (file+headline org-default-notes-file "Contact")
               "* Message/Phone %? \n%U"))))

(setq org-clock-mode-line-total 'today)

(setq org-refile-targets (quote ((nil :maxlevel . 9)
                                 (org-agenda-files :maxlevel . 9))))

(setq org-startup-with-latex-preview t)

(provide 'init-org)
