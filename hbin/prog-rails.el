;; prog-rails.el --- Enhance Rails programming
;;
;; Copyright (C) 2012 Huang Bin
;;
;; Author: Huang Bin <embrace.hbin@gmail.com>
;; Version: 1.0.0

;; This file is not part of GNU Emacs.

;;; License:

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Code:

(autoload 'yaml-mode "yaml-mode" "Edit yml document" t)
(autoload 'haml-mode "haml-mode" "Edit haml document" t)
(autoload 'slim-mode "slim-mode" "Edit slim documetn" t)
(autoload 'rspec-mode "rspec-mode" "RSpec test mode" t)
(autoload 'rhtml-mode "rhtml-mode" "Edit erb document" t)
(autoload 'eruby-nxhtml-mumamo-mode "autostart.el" "Edit erb document" t)
(autoload 'coffee-mode "coffee-mode" "Display color names with colored background" t)

;; We never want to edit Rubinius bytecode or MacRuby binaries
(add-to-list 'completion-ignored-extensions ".rbc")
(add-to-list 'completion-ignored-extensions ".rbo")

;; Rake files are ruby too, as are gemspecs, rackup files, etc.
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.thor$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rjs$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rxml$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Thorfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile$" . ruby-mode))

;; Edit yml documents
(add-to-list 'auto-mode-alist '("\\.yml" . yaml-mode))

;; Edit erb documents
(add-to-list 'auto-mode-alist '("\\.erb" . rhtml-mode))

;; Edit coffee script
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))

;; It's an amazing mode for editing erb, jsp..etc documents.
;; But I got an error in menu-bar-update-hook occasionally. Error Message:
;; (error "This buffer cannot use 'imenu-default-create-index-function'")
;; (add-to-list 'auto-mode-alist '("\\.erb" . eruby-nxhtml-mumamo-mode))

;;;###autoload
(progn
  (require 'rinari)

  ;; Automatically updating TAGS
  (setq rinari-tags-file-name "TAGS")

  ;; disable mumamo color
  (add-hook 'nxhtml-mode-hook
            (lambda ()
              (setq mumamo-background-colors nil)))

  ;; Minor modes in rhtml
  (add-hook 'rhtml-mode-hook
            (lambda ()
              (auto-complete-mode t)
              (abbrev-mode -1)          ; Don't need abbrev
              (define-key rhtml-mode-map (kbd "C-c C-r") 'rename-sgml-tag)
              (define-key rhtml-mode-map (kbd "C-c C-c") 'comment-or-uncomment-region-or-line)))

  ;; indent two spaces
  (custom-set-variables '(coffee-tab-width 2))

  (add-hook 'rinari-minor-mode-hook     ; TODO: rinari-web-server-restart binding to z
            (lambda ()
              (define-key rinari-minor-mode-map (kbd "C-.") 'insert-arrow))))

(provide 'prog-rails)
