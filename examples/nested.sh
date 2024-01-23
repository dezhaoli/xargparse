#!/usr/bin/env -S bash
###########################################################
# @Author: dezhaoli@tencent.com
# @Date:   
# Please contact dezhaoli if you have any questions.
###########################################################
. $(dirname $0)/../xargparse   # for test only





# [[ -n "$XARGPARSE_VERSION" ]] || . "$(which xargparse)"

#@
function nested_fun()
{
    a=A              #@ 
    b=B              #@ 
    ____ "$@"


    echo "a=$a"
    echo "b=$b"
}

##@@ kind='main-ex'; help='global options1:'
function nested-main-ex()
{
    author="dezhaoli"   #@ --author; help="set author"
    # local ws=''             #@ 
    ____ "$@"
    

}




























