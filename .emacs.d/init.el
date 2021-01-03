(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)

(eval-when-compile
  (require 'use-package))

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying t)

(require 'use-package-ensure)
(setq use-package-always-ensure t)

(use-package dracula-theme
  :config
  (load-theme 'dracula t))

(use-package terraform-mode)

(use-package org-pomodoro)

(use-package swift-mode)
;; (use-package sourcekit-lsp)
;; (use-package lsp-sourcekit)
(use-package flycheck-swiftlint)

(require 'epa-file)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(epg-gpg-program "/usr/local/bin/gpg")
 '(package-selected-packages
   '(makefile-executor md4rd org-pomodoro dockerfile-mode docker swift-mode org-jira mu4e-overview mu4e evil-collection elfeed-goodies elfeed terraform-mode vterm-toggle magit vue-mode poetry helm-slack org-clock spaceline evil-org company-jedi sx avy neotree evil-commentary ligature fira-code-mode linum-relative helm evil use-package melpa-upstream-visit)))
(epa-file-enable)


(require 'helm)

(setq reddit-list '(
		    "emacs"
		    "mechanicalkeyboards"))

(defun reddit-browser ()
  "Choose a subreddit to browser using helm"
  (interactive)
   
  (helm
   :prompt "Reddit: "
   :sources  `((
                (name       . "File: ")
                (candidates . ,reddit-list)
                (action     . (lambda (r)
                                (eww (concat "https://www.m.reddit.com/r/"
                                             r
                                             ))))
                ))))



(setq default-frame-alist '((font . "Source Code Pro-28")))

(use-package page-break-lines)
(use-package all-the-icons)
;  :config
;  (all-the-icons-install-fonts))
(use-package dashboard
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-banner-logo-title "Welcome to the Future, Mother Fucker")
  (setq dashboard-startup-banner 'logo)
  (setq dashboard-items '((recents  . 5)
                        (bookmarks . 5)
                        (projects . 5)
                        (agenda . 5)
                        (registers . 5))))

(add-to-list 'default-frame-alist '(fullscreen . maximized))
; (use-package ligature)
;(ligature-set-ligatures 't '("www"))
;; Enable ligatures in programming modes                                                           
; (ligature-set-ligatures 'prog-mode '("www" "**" "***" "**/" "*>" "*/" "\\\\" "\\\\\\" "{-" "::"
;                                     ":::" ":=" "!!" "!=" "!==" "-}" "----" "-->" "->" "->>"
;                                     "-<" "-<<" "-~" "#{" "#[" "##" "###" "####" "#(" "#?" "#_"
;                                     "#_(" ".-" ".=" ".." "..<" "..." "?=" "??" ";;" "/*" "/**"
;                                     "/=" "/==" "/>" "//" "///" "&&" "||" "||=" "|=" "|>" "^=" "$>"
;                                     "++" "+++" "+>" "=:=" "==" "===" "==>" "=>" "=>>" "<="
;                                     "=<<" "=/=" ">-" ">=" ">=>" ">>" ">>-" ">>=" ">>>" "<*"
;                                     "<*>" "<|" "<|>" "<$" "<$>" "<!--" "<-" "<--" "<->" "<+"
;                                     "<+>" "<=" "<==" "<=>" "<=<" "<>" "<<" "<<-" "<<=" "<<<"
;                                     "<~" "<~~" "</" "</>" "~@" "~-" "~>" "~~" "~~>" "%%"))

(use-package org
  :config
  (add-to-list 'org-modules 'org-habit t)
  (add-to-list 'org-modules 'org-clock t)
  (add-to-list 'org-modules 'org-pomodoro t))


(use-package docker)
(use-package dockerfile-mode)

;; (defun org-archive-when-done ()
;;   (if (member org-state '("DONE" "DELEGATED"))
;;       (org-archive-subtree)
;;     ()))
;; (add-hook 'org-after-todo-state-change-hook 'org-archive-when-done)

(use-package evil-commentary
  :init
  (evil-commentary-mode))

(use-package elfeed)
(use-package elfeed-org
  :config
  (setq rmh-elfeed-org-files (list "~/Sync/orgs/elfeed.org")))
(use-package elfeed-goodies
  :config
  (elfeed-goodies/setup))

(setq elfeed-feeds
      '(("http://nullprogram.com/feed/" blog emacs)
        "http://www.50ply.com/atom.xml"
        ("http://nedroid.com/feed/" webcomic)
	("http://feeds.feedburner.com/InformationIsBeautiful" reddit)
	("https://www.reddit.com/r/ACAB/" reddit politics)
	("https://www.reddit.com/r/Anarchism" reddit politics)
	("https://www.reddit.com/r/Anarchy101/" reddit politics)
	("https://www.reddit.com/r/atheism/" reddit)
	("https://www.reddit.com/r/bash/" reddit)
	("https://www.reddit.com/r/Bayes/" reddit)
	("https://www.reddit.com/r/BayesianProgramming/" reddit)
	("https://www.reddit.com/r/bladerunner/" reddit)
	("https://www.reddit.com/r/boardgames/" reddit)
	("https://www.reddit.com/r/books/" reddit)
	("https://www.reddit.com/r/BreadTube/" reddit politics)
	("https://www.reddit.com/r/CabaloftheBuildsmiths/" reddit)
	("https://www.reddit.com/r/CapitalismVSocialism/" reddit politics)
	("https://www.reddit.com/r/ChessBooks/" reddit)
	("https://www.reddit.com/r/CollegeBasketball/" reddit)
	("https://www.reddit.com/r/commandline/" reddit)
	("https://www.reddit.com/r/communism/" reddit politics)
	("https://www.reddit.com/r/communism101/" reddit politics)
	("https://www.reddit.com/r/COMPLETEANARCHY/ " reddit politics)
	("https://www.reddit.com/r/Cyberpunk/" reddit)
	("https://www.reddit.com/r/emacs/" reddit emacs)
	("https://www.reddit.com/r/sixers/" reddit)
	("https://www.reddit.com/r/unixporn/" reddit)))


(add-to-list 'evil-motion-state-modes 'elfeed-search-mode)
(add-to-list 'evil-motion-state-modes 'elfeed-show-mode)

(evil-define-key* 'motion elfeed-search-mode-map
                  "gb" #'elfeed-search-browse-url
                  "gr" #'elfeed-search-update--force
                  "gR" #'elfeed-search-fetch)

(evil-define-key* 'motion elfeed-show-mode-map
                  "gb" #'elfeed-show-visit
                  "gj" #'elfeed-show-next
                  "gk" #'elfeed-show-prev)
;; (use-package evil-collection
;;   :config
;;   (evil-collection-init))


(use-package makefile-executor
  :config
  (add-hook 'makefile-mode-hook 'makefile-executor-mode))

(use-package projectile)
(use-package helm-projectile
  :after (helm projectile))

(setq projectile-project-search-path '("~/projects/" "~/dev/"))

(use-package neotree)
;; (use-package magit)

; kbds
(defun jump-to-init-file ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(defun jump-to-orgs ()
  (interactive)
  (find-file "~/Sync/orgs"))

(defun jump-to-inbox ()
  (interactive)
  (find-file "~/Sync/orgs/inbox.org"))

(defun jump-to-notes ()
  (interactive)
  (find-file "~/Sync/orgs/notes.org"))

(defun jump-to-dev-dir ()
  (interactive)
  (find-file "~/dev/"))

(use-package evil-leader
  :config
  ; :after (helm projectile helm-projectile)
  (global-evil-leader-mode)
  (evil-leader/set-leader "<SPC>")
  (evil-leader/set-key
    "<SPC>" 'helm-M-x
    "f" 'helm-projectile-find-file
    "hf" 'helm-find-files
    "lf" 'load-file
    "sf" 'save-buffer
    ;; "sx" 'sx-search
    "t" 'neotree-toggle
    "vt" 'vterm
    "cf" 'make-empty-file
    "cd" 'make-directory
    ;; jumps
    "j" 'avy-goto-char-2
    "rss" 'elfeed
    "rsu" 'elfeed-update
    "gd" 'jump-to-dev-dir
    "gei" 'jump-to-init-file
    "gn" 'jump-to-notes
    "go" 'jump-to-orgs
    "gtd" 'jump-to-inbox
    ;; buffer stuff
    "bb" 'helm-buffers-list
    "bk" 'kill-buffer
    "bh" 'evil-prev-buffer
    "bl" 'evil-next-buffer
    "mt" 'makefile-executor-execute-target
    ;; org stuff
    "oa" 'org-agenda
    "oc" 'org-capture
    "odl" 'org-deadline
    "ohd" 'org-show-todo-tree
    "oj" 'avy-org-goto-heading-timer
    "op" 'org-property-action
    "or" 'org-refile
    "os" 'org-schedule
    "ott" 'org-todo
    ;; window splitting
    "wd" 'evil-window-delete
    "wh" 'evil-window-left
    "wj" 'evil-window-down
    "wk" 'evil-window-up
    "wl" 'evil-window-right
    "ws" 'evil-window-split
    "wv" 'evil-window-vsplit
   ))

(setq org-refile-targets '(("~/Sync/orgs/gtd.org" :maxlevel . 3)
			   ("~/Sync/orgs/someday.org" :level . 1)
			   ("~/Sync/orgs/tickler.org" :maxlevel . 2)))

;; (setq org-default-notes-file ("~/Sync/inbox.org"))


(add-hook 'shell-mode-hook 'compilation-shell-minor-mode)

(use-package poetry)

(use-package vterm)
(use-package multi-term)

(use-package info)
(use-package spaceline)
(require 'spaceline-config)
(spaceline-emacs-theme)
;; (spaceline-info-mode)
;; (spaceline-toggle-window-number-on)
;; (spaceline-toggle-major-mode-on)
(spaceline-compile
  '(((persp-name
      workspace-number
      window-number)
     :fallback evil-state
     :face highlight-face
     :priority 100)
    ((buffer-modified buffer-size buffer-id)
     :priority 98)
    (major-mode :priority 79)
    (process :when active)
    ((flycheck-error flycheck-warning flycheck-info)
     :when active
     :priority 89)
    (minor-modes :when active
		 :priority 9)
    (version-control :when active
		     :priority 78)
    (org-pomodoro :when active)
    (org-clock :when active))
  '(which-function
    (python-pyvenv :fallback python-pyenv)
    (purpose :priority 94)
    (battery :when active)
    (selection-info :priority 95)
    input-method
    ((buffer-encoding-abbrev
      point-position
      line-column)
     :separator " | "
     :priority 96)
    (global :when active)
    (buffer-position :priority 99)
    (hud :priority 99)))



(use-package evil
  :after (evil-leader) ; this ensures evil leader works in all buffers
  :config
  (evil-mode))

(use-package evil-org)
(require 'org-agenda)
(define-key org-agenda-mode-map "j" 'evil-next-line)
(define-key org-agenda-mode-map "k" 'evil-previous-line)

(use-package org-jira
  :config
  (setq jiralib-url "https://pengineering.atlassian.net"))

(use-package helm)

(use-package linum-relative
  :config
  (linum-relative-global-mode))

(use-package avy)

(use-package company
  :hook (after-init-hook global-company-mode))

(use-package company-jedi
  :after (company)
  :hook (python-mode-hook my/python-mode-hook))

(use-package sx)

;; languages
(use-package python
  :mode ("\\.py\\'" . python-mode)
  :interpreter ("python" . python-mode))

(use-package vue-mode)


;; org mode stuff
(setq org-agenda-files (list "~/Sync/orgs/"))
(setq org-todo-keywords
      '((sequence "TODO(t!)" "NEXT(n!)" "DOINGNOW(d!)" "BLOCKED(b!)" "TODELEGATE(g!)" "DELEGATED(D!)" "FOLLOWUP(f!)" "TICKLE(T!)" "UNREAD(u!)" "|" "READ(r!)" "CANCELED(c!)" "DONE(F!)")))
(setq org-todo-keyword-faces
      '(("TODO" . org-warning)
	("DOINGNOW" . "#E35DBF")
	("CANCELED" . (:foreground "white" :background "#4d4d4d" :weight bold))
	("DELEGATED" . "pink")
	("NEXT" . "#000000")))


;; (use-package helm-slack
;;   :after (slack))
(use-package slack
  :commands (slack-start)
  :init
  (setq slack-buffer-emojify t)
  (setq slack-prefer-current-team t)
  :config
  (slack-register-team
   :name "penngineering"
   :default t
   :token ""
   :subscribed-channels '(zzz-testing)
   :full-and-display-names t)

  (evil-define-key 'normal slack-info-mode-map
    ",u" 'slack-room-update-messages)
  (evil-define-key 'normal slack-mode-app
    ",c" 'slack-buffer-kill
    ",ra" 'slack-message-add-reaction
    ",rr" 'slack-message-remove-reaction))
(use-package alert
  :commands (alert)
  :init
  (setq alert-default-style 'notifier))

; (use-package mu4e)
;; (require 'mu4e)

;; ;; default
;; (setq mu4e-maildir (expand-file-name "~/Maildir"))

;; (setq mu4e-drafts-folder "/[Gmail].Drafts")
;; (setq mu4e-sent-folder   "/[Gmail].Sent Mail")
;; (setq mu4e-trash-folder  "/[Gmail].Trash")

;; ;; don't save message to Sent Messages, GMail/IMAP will take care of this
;; (setq mu4e-sent-messages-behavior 'delete)

;; ;; setup some handy shortcuts
;; (setq mu4e-maildir-shortcuts
;;       '(("/INBOX"             . ?i)
;;         ("/[Gmail].Sent Mail" . ?s)
;;         ("/[Gmail].Trash"     . ?t)))

;; ;; allow for updating mail using 'U' in the main view:
;; (setq mu4e-get-mail-command "offlineimap")

;; ;; something about ourselves
;; ;; I don't use a signature...
;; (setq
;;  user-mail-address "chris.william.addy@gmail.com"
;;  user-full-name  "chrisaddy"
;;  ;; message-signature
;;  ;;  (concat
;;  ;;    "Foo X. Bar\n"
;;  ;;    "http://www.example.com\n")
;; )

;; ;; sending mail -- replace USERNAME with your gmail username
;; ;; also, make sure the gnutls command line utils are installed
;; ;; package 'gnutls-bin' in Debian/Ubuntu, 'gnutls' in Archlinux.

;; (require 'smtpmail)

;; (setq message-send-mail-function 'smtpmail-send-it
;;       starttls-use-gnutls t
;;       smtpmail-starttls-credentials
;;       '(("smtp.gmail.com" 587 nil nil))
;;       smtpmail-auth-credentials
;;       (expand-file-name "~/.authinfo")
;;       smtpmail-default-smtp-server "smtp.gmail.com"
;;       smtpmail-smtp-server "smtp.gmail.com"
;;       smtpmail-smtp-service 587
;;       smtpmail-debug-info t)


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
