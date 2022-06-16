#!/usr/bin/env -S bash
###########################################################
# @Author: dezhaoli@tencent.com
# @Date:   
# Please contact dezhaoli if you have any questions.
###########################################################
XARGPARES_CMD_SRC="$(realpath $0)"  # This line is not needed if your command is already in $PATH


# source xargparse by:
. $(dirname $0)/../xargparse

# or by: 
# [[ -n "$XARGPARES_VERSION" ]] || . "$(which xargparse)" #(recommend)


#@
function simple_fun_1()
{
	a=                 #@ 
	____ "$@"


	echo "a=$a"
}

#@
function simple_fun_2()
{
    local a=A        #@ 
    b=B              #@ 
    ____ "$@"


    echo "a=$a"
    echo "b=$b"
}


main "$@"