xargparse
=======

Parser for command-line options, arguments and sub-commands

The `xargparse` makes it easy to write user-friendly command-line interfaces like what `argparse` does for python. The program defines what arguments it requires, and xargparse will figure out how to parse those out of BASH_ARGV. The `xargparse` also automatically generates help and usage messages and issues errors when users give the program invalid arguments.


Example

Let us start with a very simple example

./examples/cmd.sh
```shell
#@
function simple_fun()
{
	local a=A 		#@ desc='set a'
	b=B 			#@ desc='set b'
	____ "$@"


	echo "a=$a"
	echo "b=$b"
}
```
All you need to do is:
1. add `#@` before the function line, 
2. add `#@` in the end of parameter line
3. add `____ #@` after all the parameters

Here is an example of the output when running from the ./examples/cmd.sh:
```shell
DEZHAOLI-MB4:examples dezhaoli$ ./cmd.sh
usage: cmd.sh <command> [-h] [options] [positional arguments]
command:
    simple_fun [a] [b]
DEZHAOLI-MB4:examples dezhaoli$
DEZHAOLI-MB4:examples dezhaoli$
DEZHAOLI-MB4:examples dezhaoli$ ./cmd.sh simple_fun -h
usage: cmd.sh rename_fun [-h] [options] [positional arguments]

positional arguments:
    [a (A)]                                                                          #set a
    [b (B)]                                                                          #set b

DEZHAOLI-MB4:examples dezhaoli$
DEZHAOLI-MB4:examples dezhaoli$ ./cmd.sh simple_fun
a=A
b=B
DEZHAOLI-MB4:examples dezhaoli$ ./cmd.sh simple_fun "reset a's value"
a=reset a's value
b=B
DEZHAOLI-MB4:examples dezhaoli$ ./cmd.sh simple_fun "reset a's value" "reset b's value"
a=reset a's value
b=reset b's value
```



Install
-------

Get the script:

 *  OS X: Use [Homebrew][2].

         brew install xargparse

    If you need to install the latest development version

        brew unlink xargparse
        brew install --HEAD xargparse

 * Others: Download the `xargparse` and place it on your PATH.
 
Make sure that GNU `bash`, at least version 5, is on your PATH. This script will
not work unless this is that case. That means, when you type `bash` and press
enter into your terminal something actually happens.

For convenience, it is best to include `xargparse` on your path
To include `xargparse` on your path:

    export PATH=$PATH:<path to xargparse>/xargparse

Include these lines in your `.bashrc` or `.zshrc`.

*Note:* `<path to xargparse>` should be absolute and not relative.
