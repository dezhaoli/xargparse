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
	local a=A 		#@ desc='set a'
	b=B 			#@ desc='set b'
	____ "$@"


	echo "a=$a"
	echo "b=$b"
}



#@ alia="rename_fun"; desc='Function Destcription.'; flag='*'
function complicated_fun()
{
    # set -x
    local version="2.0.0"                       #@ -v; --version ;desc="option 1's description"
    local is_force=false                        #@ '-f';action='store_true';desc="option 2's description"
    local key=~                                 #@ "--key"; desc="key's description"

    local f_file_name=""                        #@ "file"; desc="f_file_name's description";
    local path='/'                              #@ desc="path's description";
    local ws="eeeee"                            #@ workspace; desc="ws's description";
    local res_list=()                           #@ "others"; nargs='*'; desc="res_list's description";
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
function choices_fun()
{
	local mode=''			#@ -m; choices=('release' 'debug');desc='choice mode'
	local fruit=''			#@ choices=( apple orange banana );desc='choice fruit'
    ____ "$@"


    
    echo "mode=$mode"
    echo "fruit=$fruit"
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

##@@ alia='main-ex'; func='android-parse-args'; desc='global options:'
function android-parse-args()
{

	bundle_id="dezhaoli"						#@ -b; desc="set bundleid"
	
	args=()
	raw_args+=( "$@" )
	while (( "$#" )); do
		case "$1" in
		-b)
			bundle_id="$2"
			shift 2
			;;
		*) # preserve positional arguments
			args+=("$1")
			shift
			;;
		esac
	done

}
##@@ alia='label'; desc='some extend message...'


main "$@"
