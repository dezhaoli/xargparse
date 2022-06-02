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

Let's take a more complicated example

./examples/cmd.sh

```shell
#@ alia="rename_fun"; desc='Function Destcription.'; flag='*'
function complicated_fun()
{
    local version="2.0.0"                       #@ -v; --version ;desc="option 1's description"
    local is_force=false                        #@ '-f';action='store_true';desc="option 2's description"
    local key=~                                 #@ "--key"; desc="key's description"

    local f_file_name=""                        #@ "file"; desc="f_file_name's description";
    local path='/'                              #@ desc="path's description";
    local ws="eeeee"                            #@ workspace; desc="ws's description";
    local res_list=()                           #@ "others"; nargs='+'; desc="res_list's description";
    ____ "$@"

    echo "version=$version"
    echo "is_force=$is_force"
    echo "key=$key"
    echo "file=$f_file_name"
    echo "path=$path"
    echo "ws=$ws"
    for i in "${res_list[@]}" ; do echo "=>$i";done

}
```

And now the output:

```shell
DEZHAOLI-MB4:examples dezhaoli$ ./cmd.sh
usage: cmd.sh <command> [-h] [options] [positional arguments]
command:
    simple_fun [a] [b]
  * rename_fun [-v|--version arg] [-f] [--key arg]  file [path] [workspace] [others...]  #Function Destcription.
DEZHAOLI-MB4:examples dezhaoli$
DEZHAOLI-MB4:examples dezhaoli$
DEZHAOLI-MB4:examples dezhaoli$ ./cmd.sh rename_fun
usage: cmd.sh rename_fun [-h] [options] [positional arguments]
options:
    -v, --version arg (2.0.0)                                                        #option 1's description
    -f (false)                                                                       #option 2's description
    --key arg (/Users/dezhaoli)                                                      #key's description
positional arguments:
    file                                                                             #f_file_name's description
    [path (/)]                                                                       #path's description
    [workspace (eeeee)]                                                              #ws's description
    [others...]                                                                      #res_list's description

error: the following arguments are required: file
DEZHAOLI-MB4:examples dezhaoli$ ./cmd.sh rename_fun a.apk
version=2.0.0
is_force=false
key=/Users/dezhaoli
file=a.apk
path=/
ws=eeeee
DEZHAOLI-MB4:examples dezhaoli$ ./cmd.sh rename_fun a.apk /root/usr/
version=2.0.0
is_force=false
key=/Users/dezhaoli
file=a.apk
path=/root/usr/
ws=eeeee
DEZHAOLI-MB4:examples dezhaoli$ ./cmd.sh rename_fun a.apk /root/usr/ apks
version=2.0.0
is_force=false
key=/Users/dezhaoli
file=a.apk
path=/root/usr/
ws=apks
DEZHAOLI-MB4:examples dezhaoli$

```

Conclusion

The xargparse offers a lot more than shown here. More details can refer to the example file.



Install
-------

Get the script:

 *  OS X: Use [Homebrew][2].

	```shell
        brew tap dezhaoli/d
        brew install xargparse
	```

    If you need to install the latest development version
    
	```shell
        brew unlink xargparse
        brew install --HEAD xargparse
	```

 * Others: Download the `xargparse` and place it on your PATH.
 
Make sure that GNU `bash`, at least version 5, is on your PATH. This script will
not work unless this is that case. That means, when you type `bash` and press
enter into your terminal something actually happens.

For convenience, it is best to include `xargparse` in your Bash Profiles

To include `xargparse` in your Bash Profiles:

    source <path to xargparse>/xargparse

Include these lines in your `.bashrc` or `.zshrc`.

*Note:* `<path to xargparse>` should be absolute and not relative.
