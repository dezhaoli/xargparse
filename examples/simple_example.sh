#!/usr/bin/env -S bash
###########################################################
# @Author: dezhaoli@tencent.com
# @Date:   
# Please contact dezhaoli if you have any questions.
###########################################################
# . $(dirname $0)/../xargparse   # for test only






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





























