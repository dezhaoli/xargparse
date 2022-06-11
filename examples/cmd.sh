#!/usr/bin/env -S bash
###########################################################
# @Author: dezhaoli@tencent.com
# @Date:   
# Please contact dezhaoli if you have any questions.
###########################################################
XARGPARES_CMD_SRC="$(realpath $0)"
cd $(dirname $0)


. ../xargparse
# [[ -n "$XARGPARES_VERSION" ]] || . "$(which xargparse)"


# XARGPARES_DEBUG=true


#@
function simple_fun()
{
	local a=A 		#@ help='set a'
	b=B 			#@ help='set b'
	____ "$@"


	echo "a=$a"
	echo "b=$b"
}





#@ help='example of action store'
function store_fun()
{
    local is_force=false                        #@ '-f';action='store_true'
    local v=value                               #@ '-v';action='store_some_other_value'
    ____ "$@"

    echo "is_force=$is_force"
    echo "v=$v"
}


#@ help='example of action append'
function append_fun()
{
    local v=( good luck )                       #@ '-v';action='append'
    ____ "$@"

    for i in "${v[@]}" ; do echo "v=>$i";done
}


#@ help='example of choices'
function choices_fun()
{
    local mode=''           #@ -m; choices=('release' 'debug');help='choice mode'
    local fruit=''          #@ choices=( apple orange banana );help='choice fruit'
    ____ "$@"


    echo "mode=$mode"
    echo "fruit=$fruit"
}



#@ alia="rename_fun"; help='Function Destcription.'; flag='*'
function complicated_fun()
{
    # set -x
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

#@
function auto_completion_1()
{
	echo "auto_completion_1 called!"
}
#@
function auto_completion_2()
{
	echo "auto_completion_2 called!"
}

#@
function test_main_ex()
{
    local mode=''           #@ -m; choices=('release' 'debug');help='choice mode'
    local fruit=''          #@ choices=( apple orange banana );help='choice fruit'
    ____ "$@"


    echo "bundle_id=$bundle_id"
    echo "mode=$mode"
    echo "fruit=$fruit"
}

##@@ alia='main-ex'; func='main-ex'; help='global options:'
function main-ex()
{
	bundle_id="dezhaoli"	#@ -b; help="set bundleid"
    ____ "$@"
	

    echo "DDDD"


}
##@@ alia='label'; help='some extend message...'


main "$@"
