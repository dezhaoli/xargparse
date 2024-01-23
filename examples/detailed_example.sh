#!/usr/bin/env -S bash
###########################################################
# @Author: dezhaoli@tencent.com
# @Date:   
# Please contact dezhaoli if you have any questions.
###########################################################
# XARGPARSE_CMD_SRC="$(realpath $0)"  # This line is not needed if your command is already in $PATH


# source xargparse by:
[[ -n "$XARGPARSE_VERSION" ]] || . "$(which xargparse)" #(recommend)

# or by: 
# . $(dirname $0)/../xargparse


#@ help="tips for function"
function tips_fun()
{
	a= 		#@ help='tips for argument'
	____ "$@"


	echo "a=$a"
}


#@ help='example of action store'
function store_fun()
{
    is_force=false                        #@ '-f';action='store_true'
    v=value                               #@ '-v';action='store_some_other_value'
    ____ "$@"

    echo "is_force=$is_force"
    echo "v=$v"
}


#@ help='example of action append'
function append_fun()
{
    v=( good luck )                       #@ '-v';action='append'
    ____ "$@"

    for i in "${v[@]}" ; do echo "v=>$i";done
}


#@ help='example of choices'
function choices_fun()
{
    mode=           #@ -m; choices=('release' 'debug');help='choice mode'
    fruit=          #@ choices=( apple orange banana );help='choice fruit'
    ____ "$@"


    echo "mode=$mode"
    echo "fruit=$fruit"
}


#@ alia="rename_fun"; help='Function Destcription.'; flag='*'
function complicated_fun()
{
    local version="2.0.0"                       #@ -v; --version ;help="option 1's description"
    local is_force=false                        #@ '-f';action='store_true';help="option 2's description"
    local key=~                                 #@ "--key"; help="key's description"

    local f_file_name=""                        #@ "file"; help="f_file_name's description";
    local path='/'                              #@ help="path's description";
    local ws="eeeee"                            #@ workspace; help="ws's description";
    local res_list=()                           #@ "others"; nargs='*'; help="res_list's description";
    ____ "$@"

    echo "version=$version"
    echo "is_force=$is_force"
    echo "key=$key"
    echo "file=$f_file_name"
    echo "path=$path"
    echo "ws=$ws"
    for i in "${res_list[@]}" ; do echo "=>$i";done

}

#TODO: support group title and message
##@@ kind='group'; help='some message'

#@ group=aa help="group aa's function"
function grouped_fun_1()
{
	echo "grouped_fun_1 called!"
}
#@ group=aa
function grouped_fun_2()
{
	echo "grouped_fun_2 called!"
}



#@
function test_main_ex()
{
    local mode=''           #@ -m; choices=('release' 'debug');help='choice mode'
    local fruit=''          #@ choices=( apple orange banana );help='choice fruit'
    ____ "$@"


    echo "author=$author"
    echo "mode=$mode"
    echo "fruit=$fruit"
}

##@@ kind='label'; help='some extend message...'

##@@ kind='main-ex'; help='global options:'
function main-ex()
{
	author="dezhaoli"	#@ -b; help="set author"
    # local ws=''             #@ 
    ____ "$@"
	

}


main "$@"
