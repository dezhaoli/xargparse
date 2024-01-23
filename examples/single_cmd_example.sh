#!/usr/bin/env -S bash
###########################################################
# @Author: dezhaoli@tencent.com
# @Date:   
# Please contact dezhaoli if you have any questions.
###########################################################
# . $(dirname $0)/../xargparse   # for test only






[[ -n "$XARGPARSE_VERSION" ]] || . "$(which xargparse)"

#@
function _main()
{
    is_verbose=false    #@ -v; --verbose; action=store_true
    is_force=false      #@ -f; --force; action=store_true
    is_debug=false      #@ -d; --debug; action=store_true
    is_output=false      #@ -o; --output; action=store_true
    a=A                 #@ 
    b=B                 #@ 
    ____ "$@"


    echo "is_verbose=$is_verbose"
    echo "is_force=$is_force"
    echo "is_debug=$is_debug"
    echo "is_output=$is_output"
    echo "a=$a"
    echo "b=$b"
}

main "$@"





























