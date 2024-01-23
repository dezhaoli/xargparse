#!/usr/bin/env -S bash
###########################################################
# @Author: dezhaoli@tencent.com
# @Date:   
# Please contact dezhaoli if you have any questions.
###########################################################


# Copyright 2009, The Android Open Source Project

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#   http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
###########################################################


__d_init()
{
    [[ -n "$XARGPARSE_VERSION" ]] || . "$(which xargparse)"
    [[ -n "$XFORMAT_VERSION" ]] || . "$(which xformat)"
    [[ -n "$XWSL_EX_VERSION" ]] || . "$(which xwsl-ex)"

    export LC_CTYPE=en_US.UTF-8

    : ${IS_WSL:=false}
    XFORMAT_IS_PRINT_TIME=true
    XARGPARSE_SMART_MODE=true
}



__d_add_path()
{
	local p="$1"
	if [[ ! "$PATH" =~ "$p" ]]; then
	  export PATH="$p:$PATH"
	fi
}

#remove all bash_completion, regenerate them
__d_generate_bash_completion()
{
    echo "$(basename "$0") $XARGPARSE_VERSION"
    while read line; do
        rm -fr "$XARGPARSE_COMPLETE_DIR/$line"
        if [[ "$line" != "d" ]]; then
            "$line"  >/dev/null 2>&1
        fi
    done < <( ls -1 "$XARGPARSE_COMPLETE_DIR" )
}


__d_init

# call ourself
if [[ ! "$0" =~ ^-.* && "$(basename "$0")" == "$(basename "$BASH_SOURCE")" ]]; then 
    __d_generate_bash_completion
    exit 0
fi