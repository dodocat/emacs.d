;; prog-web.el --- Enhance HTML & CSS
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

;;;###autoload
(progn
  (require 'rainbow-mode)
  (require 'zencoding-mode)

  (hbin-remove-mm-lighter 'rainbow-mode)

  ;; CSS
  (add-hook 'css-mode-hook 'rainbow-mode)
  (custom-set-variables '(css-indent-offset 2))

  ;; HTML
  (add-hook 'sgml-mode-hook
            (lambda ()
              (rainbow-mode 1)
              (zencoding-mode 1)))
  )

(provide 'prog-web)
