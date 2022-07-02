xargparse
=======

Parser for command-line options, arguments and sub-commands. auto create command completions for the Bash shell.

The `xargparse` makes it easy to write user-friendly command-line interfaces like what `argparse` does for python. The program defines what arguments it requires, and xargparse will figure out how to parse those out of BASH_ARGV. The `xargparse` also automatically generates help and usage messages and issues errors when users give the program invalid arguments.

![auto_completion_demo](https://user-images.githubusercontent.com/23163073/172112615-93d69969-041c-45ce-9515-66cee4fe2d0e.gif)
![autocomplete](https://user-images.githubusercontent.com/23163073/177006071-536351c6-4ac3-4228-9756-a668b42d995e.gif)



Example

Let us start with a very simple example

./examples/cmd.sh
```shell
#@
function simple_fun()
{
	local a=A 		#@ 
	b=B 			#@ 
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
![simple_arg_parse_demo](https://user-images.githubusercontent.com/23163073/172113718-79d5c378-08ea-4fcb-94be-69f4e6e554b8.gif)


Let's take a more complicated example

./examples/cmd.sh

```shell
#@ alia="rename_fun"; help='Function Destcription.'; flag='*'
function complicated_fun()
{
    local version="2.0.0"                       #@ -v; --version ;help="option 1's description"
    local is_force=false                        #@ '-f';action='store_true';help="option 2's description"
    local key=~                                 #@ "--key"; help="key's description"

    local f_file_name=""                        #@ "file"; help="f_file_name's description";
    local path='/'                              #@ help="path's description";
    local ws="eeeee"                            #@ workspace; help="ws's description";
    local res_list=()                           #@ "others"; nargs='+'; help="res_list's description";
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
$ ./cmd.sh
usage: cmd.sh <command> [-h] [options] [positional arguments]
command:
    simple_fun [a] [b]
  * rename_fun [-v|--version arg] [-f] [--key arg]  file [path] [workspace] [others...]  #Function Destcription.
$
$ ./cmd.sh rename_fun
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
$ ./cmd.sh rename_fun a.apk
version=2.0.0
is_force=false
key=/Users/dezhaoli
file=a.apk
path=/
ws=eeeee
$ ./cmd.sh rename_fun a.apk /root/usr/
version=2.0.0
is_force=false
key=/Users/dezhaoli
file=a.apk
path=/root/usr/
ws=eeeee
$ ./cmd.sh rename_fun a.apk /root/usr/ apks
version=2.0.0
is_force=false
key=/Users/dezhaoli
file=a.apk
path=/root/usr/
ws=apks

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
 
Make sure that GNU `bash`, at least version 4, is on your PATH. This script will
not work unless this is that case. 

add the following code to your script:

    [[ -n "$XARGPARES_VERSION" ]] || . "$(which xargparse)"

Code Completion
-------

If you have bash-completion installed, that automatically enables code completion. 
Otherwise, just add the following code to /etc/bashrc or ~/.bash_profile or ~/.bashrc
to enables code completion

    [[ -r "/opt/homebrew/opt/xargparse/bin/xcomplete" ]] && . "/opt/homebrew/opt/xargparse/bin/xcomplete"

