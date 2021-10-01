;;; adelfa-syntax.el
;;
;; Copyright (C) 2021 Chase Johnson
;;
;; Authors: Chase Johnson <joh13266@umn.edu>
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  Description
;;
;;; Code:
(require 'font-lock)

(defconst adelfa-core-font-lock-keywords
  '(
    ("\\_<\\(=>\\||-\\|[][{}]\\)\\_>"
     . font-lock-builtin-face)
    ("\\_<\\(/\\\\\\|:=\\|=>\\|\\\\/\\|[,.:;=]\\)\\_>"
     . font-lock-builtin-face)
    ;; forall, exists, true, false, pred, ctx
    ("\\<\\(exists\\|forall\\|true\\|false\\|ctx\\|pred\\|induction\\|case\\|intros\\|apply\\|search\\)\\>"
     . font-lock-keyword-face)
    )
  "Adelfa core language font-lock keywords.")

(defconst adelfa-reasoning-font-lock-keywords
  '(
    ;;
    ("\\<\\(Query\\|Set\\)\\>" . font-lock-builtin-face)
    ("\\<\\(Import\\|Specification\\)\\>" . font-lock-builtin-face)
    ("\\<\\(Type\\|Kind\\|Close\\)\\>"
     . font-lock-keyword-face)
    ("\\<\\(\\(?:Co\\)?Define\\)\\>". font-lock-keyword-face)
    ("\\<\\(Theorem\\|Split\\)\\>"
     . font-lock-keyword-face)
    ("\\<\\(skip\\|assert\\)\\>"
     . font-lock-warning-face))
  "Default highlighting for Adelfa major mode.")

(defconst adelfa-script-font-lock-keywords
  (append adelfa-core-font-lock-keywords
          adelfa-reasoning-font-lock-keywords))

(defconst adelfa-goals-font-lock-keywords
  (list
   (cons "\\<\\(subgoal\\)\\>" font-lock-keyword-face))
  "Adelfa default goal highlight.")

(defconst adelfa-response-font-lock-keywords
  (list
   (cons "\\<\\(Proof completed!\\)\\>" font-lock-function-name-face))
  "Default highlighting for Adelfa Response mode.")

(defconst adelfa-mode-syntax-table-entries
  (append '(?_ "w")
          '(?' "w")
          '(?/ ". 14n")
          '(?* ". 23n")
          '(?% "< b")
          '(?\n "> b")
          '(?. ".")
          '(?+ ".")
          '(?- ".")
          '(?= ".")
          '(?> ".")
          '(?< ".")
          '(?# ".")
          '(?\ ".")))

(provide 'adelfa-syntax)
;;; adelfa-syntax.el ends here
