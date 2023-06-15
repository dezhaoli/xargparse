#!/usr/bin/env -S bash
###########################################################
# @Author: dezhaoli@tencent.com
# @Date:   
# Please contact dezhaoli if you have any questions.
###########################################################






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





























