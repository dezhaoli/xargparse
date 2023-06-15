xargparse
=======

Parser for command-line options, arguments and sub-commands. auto create command completions for the Bash shell.

The `xargparse` makes it easy to write user-friendly command-line interfaces like what `argparse` does for python. The program defines what arguments it requires, and xargparse will figure out how to parse those out of BASH_ARGV. The `xargparse` also automatically generates help and usage messages and issues errors when users give the program invalid arguments.

![autocomplete](https://user-images.githubusercontent.com/23163073/177006071-536351c6-4ac3-4228-9756-a668b42d995e.gif)



Example

Let us start with a very simple example

./examples/simple_example.sh
```shell

[[ -n "$XARGPARES_VERSION" ]] || . "$(which xargparse)"

#@
function simple_fun()
{
    a=A              #@ 
    b=B              #@ 
    ____ "$@"


    echo "a=$a"
    echo "b=$b"
}

main "$@"

```
All you need to do is:
1. source the `xargparse`
2. add `#@` before the function line, 
3. add `#@` in the end of parameter line
4. add `____ #@` after all the parameters
5. add `main "$@"` at the end of the script file

Here is an example of the output when running from the ./examples/simple_example.sh:
![simple](https://user-images.githubusercontent.com/23163073/177006668-27eb6ca0-8f3b-4718-83bf-1a6b00817bfb.gif)



Let's take a more complicated example

./examples/detailed_example.sh

```shell
...
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
...
```

And now the output of help and usage messages:

![detail](https://user-images.githubusercontent.com/23163073/177007375-a6af11c9-6245-432d-8cb3-d0ba4cdba844.gif)


Note

the keywords listed below are used by xargparse and DONOT used them as argument identifier

|  keyword   |  description  | example
|  ----  | ----  | ----  |
|action| Specify how an argument should be handled. suported actions are `store action`  `append action`  `costom action` | action=store_true, action=store_false, action=store_xxx, action=append,  action=costom_function |
|choices| Limit values to a specific set of choices |choices=( x x1 x2 ) |
|nargs| Number of times the argument can be used | nargs=*, nargs=?, nargs=+  |
|help| Help message for an argument |  |
|filter| Used by xcomplete to filter which files to be list.  | filter='-dir'  |




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

