# Adelfa Proof General

This fork of Proof General adds support for
[Adelfa](http://sparrow.cs.umn.edu/adelfa/) to Proof General.

## Installation

Clone this repo by running:

``` sh
git clone https://github.com/CJohnson19/PG
```

In your Emacs configuration, commonly located at `~/.emacs` or
`~/.emacs.d/init.el`, add the following lines: 

``` emacs-lisp
(defconst proof-site-file
  (expand-file-name "path-to-pg/PG/generic/proof-site.el"))

(when (file-exists-p proof-site-file)
  (setq proof-splash-enable nil
        proof-output-tooltips nil
        proof-three-window-mode-policy 'horizontal)

  (load-file proof-site-file)

  (add-hook 'adelfa-mode-hook
            #'(lambda ()
                (setq indent-line-function 'indent-relative)))

  (setq auto-mode-alist
        (append
         '(("\\.ath\\'" . adelfa-mode))
         auto-mode-alist)))
```

Where `path-to-pg` should be changed to the file path of your installation
location of Proof General.

If you have previously installed Proof General and it seems Adelfa isn't
working, the byte compilation of your installation may be out of date. Running
the `make` command in the `PG` directory should refresh them. You may also wish
to not byte compile PG by running `make clean`.

## Using Proof General

You can now use Emacs to open a `ath` file. After executing your first command
you should see two new windows representing the assistant's state. Some
basic and common Proof General commands are:

- `C-c C-RET` Execute command(s) up to the pointer position.
- `C-c C-n` Execute next command.
- `C-c C-u` Undo last command.

Where then `C-c C-n` notation represents control key with "c" followed by
control key with "n".

More in depth instructions can be found in the [Proof General User
Documentation](https://proofgeneral.github.io/doc/master/userman/).

## Important Notes

Adelfa compatibility with Proof General is still in its infancy. It should work
for many common workflows, but it may become out of sync at times. This happens
when an error occurs in Adelfa that is not recognized as such by Proof General.
When this happens, abort the proof with `C-c C-x` and continue the proof up to
the unrecognized error. Even better, consider [creating an
issue](https://github.com/CJohnson19/PG/issues/new) with what Adelfa responded
with.

Adelfa doesn't have a notion of undoing a completed proof. Therefore, if you
want to add content above a completed proof, Proof General can become confused,
and you should restart to sync the state again.
