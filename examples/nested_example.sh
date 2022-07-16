#!/usr/bin/env -S bash
###########################################################
# @Author: dezhaoli@tencent.com
# @Date:   
# Please contact dezhaoli if you have any questions.
###########################################################


source $(dirname "$0")/nested.sh



#@
function not_nested_fun()
{
    echo "not_nested_fun called."
}

#@
function print_glbal_option()
{
    echo "author=$author"
    echo "author_2=$author_2"
}

##@@ kind='main-ex'; help='global options2:'
function main-ex()
{
    author_2="dezhaoli"         #@ --new-author; help="set author"
    # local ws=''               #@ 
    ____ "$@"
    

}



main "$@"

























