;;; adelfa-syntax.el
;;
;; Copyright (C) 2021 Chase Johnson
;;
;; Authors: Chase Johnson <joh13266@umn.edu>
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;  There still needs to be work done on detecting symbols correctly,
;;  and pruning unnecessary terms from the syntax.
;;
;;  Description:
;;  This file provides fontification with the font-lock package for Adelfa.
;;  All keywords and symbols were gathered from the Adelfa reference guide,
;;  located at http://sparrow.cs.umn.edu/adelfa/reference-guide.html
;;
;;; Code:
(require 'font-lock)

(defconst adelfa-core-font-lock-keywords
  '(
    ;; (regexp-opt '("=>" "|-" "[" "]" "{" "}" "/\\" "\\/") 'symbols)
    ("\\_<\\(/\\\\\\|=>\\|\\\\/\\||-\\|[][{}]\\)\\_>"
     . font-lock-builtin-face)
    ;; (regexp-opt '("forall" "ctx" "pred") 'words)
    ("\\<\\(forall\\|ctx\\|pred\\|exists\\)\\>"
     . font-lock-keyword-face)
    ;; (regexp-opt '("true" "false") 'words)
    ("\\<\\(\\(?:fals\\|tru\\)e\\)\\>"
     . font-lock-constant-face)
    )
  "Adelfa core language font-lock keywords.")

(defconst adelfa-reasoning-font-lock-keywords
  '(
    ;; (regexp-opt '("Schema" "Specification") 'words)
    ("\\<\\(S\\(?:chema\\|pecification\\)\\)\\>"
     . font-lock-builtin-face)
    ;; (regexp-opt '("Define") 'words)
    ("\\<\\(Define\\)\\>"
     . font-lock-keyword-face)
    ;; (regexp-opt '("Theorem") 'words)
    ("\\<\\(Theorem\\)\\>"
     . font-lock-keyword-face)
    ;; (regexp-opt '("search" "intros" "split" "left" "right" "apply" "induction" "exists" "case") 'words)
    ("\\<\\(apply\\|case\\|exists\\|in\\(?:duction\\|tros\\)\\|left\\|right\\|s\\(?:earch\\|plit\\)\\)\\>"
     . font-lock-builtin-face)
    ;; (regexp-opt '("weaken" "strengthen" "ctxpermute" "inst" "prune" "unfold" "applydfn") 'words)
    ("\\<\\(weaken\\|strengthen\\|ctxpermute\\|inst\\|prune\\|unfold\\|applydfn\\)\\>"
     . font-lock-builtin-face)
    ;; (regexp-opt '("skip" "assert") 'words)
    ("\\<\\(skip\\|assert\\)\\>"
     . font-lock-warning-face)
    )
  "Default highlighting for Adelfa major mode.")

(defconst adelfa-script-font-lock-keywords
  (append adelfa-reasoning-font-lock-keywords
          adelfa-core-font-lock-keywords))

(defconst adelfa-goals-keywords
  '(
    ;; (regexp-opt '("Vars" "Nominals" "IH") 'words)
    ("\\<\\(IH\\|\\(?:Nominal\\|Var\\)s\\)\\>" . font-lock-constant-face)
    ("\\<\\(H[0-9]+\\)\\>" . font-lock-function-name-face)
    ("\\<\\(Subgoal .*\\)\\>" . font-lock-variable-name-face)
    ("\\<\\(Proof Completed\\)\\>" . font-lock-function-name-face)
    )
  "Adelfa default goal highlight.")

(defconst adelfa-response-keywords
  '(
    ;; (regexp-opt '("Vars" "Nominals" "IH") 'words)
    ("\\<\\(IH\\|\\(?:Nominal\\|Var\\)s\\)\\>" . font-lock-constant-face)
    ("\\<\\(H[0-9]+\\)\\>" . font-lock-function-name-face)
    ("\\<\\(Subgoal .*\\)\\>" . font-lock-variable-name-face)
    ("\\<\\(Proof Completed\\)\\>" . font-lock-function-name-face)
    )
  "Default highlighting for Adelfa Response mode.")

(defconst adelfa-response-font-lock-keywords
  (append adelfa-response-keywords
          adelfa-core-font-lock-keywords))

(defconst adelfa-goals-font-lock-keywords
  (append adelfa-goals-keywords
          adelfa-core-font-lock-keywords))

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
