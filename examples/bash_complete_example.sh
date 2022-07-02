#!/usr/bin/env -S bash
###########################################################
# @Author: dezhaoli@tencent.com
# @Date:   
# Please contact dezhaoli if you have any questions.
###########################################################
# . $(dirname $0)/../xargparse   # for test only






[[ -n "$XARGPARES_VERSION" ]] || . "$(which xargparse)"

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
function auto_completion_3()
{
    fruit=          #@ choices=( apple orange banana );help='choice fruit'
    cmd=            #@ choices=( eat package cook )
    ____ "$@"

    echo ":$cmd $fruit."
}



"$@"
