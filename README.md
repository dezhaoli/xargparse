xargparse
=======

Parser for command-line options, arguments and sub-commands



Install
-------

Get the script:

 *  OS X: Use [Homebrew][2].

         brew install xargparse

    If you need to install the latest development version

        brew unlink pidcat
        brew install --HEAD xargparse

 * Others: Download the `pidcat.py` and place it on your PATH.
 
Make sure that GNU `bash`, version 5, is on your PATH. This script will
not work unless this is that case. That means, when you type `bash` and press
enter into your terminal something actually happens.

For convenience, it is best to include `xargparse` on your path
To include `xargparse` on your path:

    export PATH=$PATH:<path to xargparse>/xargparse

Include these lines in your `.bashrc` or `.zshrc`.

*Note:* `<path to xargparse>` should be absolute and not relative.
