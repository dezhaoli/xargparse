#!/usr/bin/env -S bash
###########################################################
# @Author: dezhaoli@tencent.com
# @Date:   
# Please contact dezhaoli if you have any questions.
###########################################################
XARGPARES_CMD_SRC="$(realpath $0)"  # This line is not needed if your command is already in $PATH


. $(dirname $0)/../xargparse






#@ help='example of choices'
function complete_filter_fun()
{
    local dir_pos=''            #@ filter='-dir'
    local file_pos=''           #@ filter='sh'
    ____ "$@"


    echo "dir_pos=$dir_pos"
    echo "file_pos=$file_pos"
}


#@ group=aa
function auto_completion_1()
{
	echo "auto_completion_1 called!"
}
#@ group=aa
function auto_completion_2()
{
	echo "auto_completion_2 called!"
}


main "$@"
