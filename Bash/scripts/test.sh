#!/usr/bin/env bash
# Programm: HalloWelt.sh
# Version: 1.0
# Autor: TKluser
# Datum: 08.09.2021
# Lizenz: MIT
# Beschreibung: <TODO>

#region Functions

function is_num {
    # string
    REGEX='^[0-9]+$'
    if [[ $1 =~ $REGEX ]]; then
        true
    else
        false
    fi
}

function is_decimal {
    # string
    REGEX='^[0-9]+(\.[0-9]+$|$)'
    if [[ $1 =~ $REGEX ]]; then
        true
    else
        false
    fi
}

function is_str {
    # string
    REGEX='[A-Za-z0-9_]+'
    if [[ $1 =~ $REGEX ]]; then
        true
    else
        false
    fi
}

function file_exists {
    # file
    if [ -f "$1" ] && [ -n "$1" ]; then
        true
    else
        false
    fi
}

function folder_exists {
    # folder
    if [ -d "$1" ] && [ -n "$1" ]; then
        true
    else
        false
    fi
}

function files_are_equal {
    # file
    # file
    diff $1 $2 &>/dev/null
    return $?
}

function file_contains {
    # file
    # expression
    grep -e $2 $1 &>/dev/null
    return $?
}

function folder_empty {
    # folder
    if [ -n "$(ls -A $1 2>/dev/null)" ]; then
        false
    else
        true
    fi
}

function folder_contains {
    # folder
    # filename / expression
    ls -la $1 | grep -e $2 &>/dev/null
    return $?
}

function kill_process {
    # string
    kill $(ps -Alf | grep $1 | tr -s [:blank:] '\t' | head -n1 | cut -f4)
}

function get_file_line {
    # file
    # line
    sed "$2q;d" $1
}

USER_INPUT=""
function get_input {
    # string
    echo -n "$1 "
    read
    USER_INPUT=$REPLY
}

function read_confirmation {
    read -p "Do you want to continue? [Y/n] " -n 1 -r
    REGEX="^[Yy]$"
    if [[ $REPLY =~ $REGEX ]]; then
        true
    else
        false
    fi
}

function get_filename {
    basename $1
}

function script_error {
    exit 1
}

function script_success {
    exit 0
}

function print_usage {
    echo "usage: $0 dir1 dir2" # string / num / decimal / dir / file
}

#endregion Functions

PARAMS=("dir1" "dir2")
if [ $# -ne ${#PARAMS[@]} ]; then
    # echo "error: not all paramters specified"
    # print_usage
    # script_error
    # ---
    # for every param ask for user input
    for i in ${!PARAMS[@]}; do
        PARAM_NAME="${PARAMS[$i]}"
        get_input ${PARAMS[$i]}
        printf -v "$PARAM_NAME" "%s" "$USER_INPUT"
    done
else
    # set all params to corresponding param variable
    for i in ${!PARAMS[@]}; do
        PARAM_NAME="${PARAMS[$i]}"
        index=$((i + 1))
        VALUE=${!index}
        printf -v "$PARAM_NAME" "%s" "$VALUE"
    done
fi

# Parameter validation
if ! folder_exists $dir1 || ! folder_exists $dir2; then
    echo "error: parameter validation failed"
    print_usage
    script_error
fi

if folder_contains _test/ "log.log"; then
    echo "folder contains"
fi

if file_contains hallo.txt ".*ha.*"; then
    echo "file contains"
fi

# --> CODE HERE <--

# Script End
read -p "Press any key to continue ..." -n 1 -t 10
script_success
