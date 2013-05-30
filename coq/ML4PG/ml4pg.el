(defvar ml4pg-home-dir (concatenate 'string proof-home-directory "coq/ML4PG/"))
(defconst *matlab-program* nil)
(defconst *weka-dir* (concatenate 'string proof-home-directory "coq/ML4PG/weka.jar"))


(defvar ml4pg-mode nil)

(defun ml4pg-select-mode ()
  (interactive)
  (let ((smode (read-string "What mode do you want to use (Coq -> c (default), SSReflect -> s): ")))
    (setq ml4pg-mode smode)
    (cond ((string= ml4pg-mode "s") 
	   (progn  (load-file (concat ml4pg-home-dir "ssreflect/auxiliary_files.el"))
		   (load-file (concat ml4pg-home-dir "ssreflect/feature_extraction_2.el"))
		   (load-file (concat ml4pg-home-dir "ssreflect/matlab_interaction.el"))
		   (load-file (concat ml4pg-home-dir "ssreflect/shortcuts.el"))
		   (load-file (concat ml4pg-home-dir "ssreflect/menus.el"))
		   (load-file (concat ml4pg-home-dir "ssreflect/storage.el"))
		   (load-file (concat ml4pg-home-dir "ssreflect/save_lemmas.el"))
		   (load-file (concat ml4pg-home-dir "ssreflect/weka.el"))
		   (ml4pg-init-clusters)
		   (ml4pg-activate-icons)
		   (ml4pg-exported-libraries)
		   ))
	  (t (progn (load-file (concat ml4pg-home-dir "coq/auxiliary_files.el"))
		   (load-file (concat ml4pg-home-dir "coq/feature_extraction.el"))
		   (load-file (concat ml4pg-home-dir "coq/matlab_interaction.el"))
		   (load-file (concat ml4pg-home-dir "coq/shortcuts.el"))
		   (load-file (concat ml4pg-home-dir "coq/menus.el"))
		   (load-file (concat ml4pg-home-dir "coq/storage.el"))
		   (load-file (concat ml4pg-home-dir "coq/save_lemmas.el"))
		   (load-file (concat ml4pg-home-dir "coq/weka.el"))
		   (ml4pg-init-clusters)
		   (ml4pg-activate-icons)
		   (ml4pg-exported-libraries)
		   ))
	  ))
  (let ((ex? (read-string "Do you want to extract the features of the lemmas of this library (Yes -> y, No -> n): ")))
    (if (string= ex? "y") 
	(progn (let ((b (buffer-name)))
		 (ml4pg-extract-theorems-library)
		 (delete-other-windows)
		 (switch-to-buffer-other-window "*display*")
		 (delete-other-windows)
		 (switch-to-buffer-other-window b)
		 (delete-other-windows)
		 (proof-shell-invisible-cmd-get-result (format "Unset Printing All"))
	       ))
      nil
	  )))





