#!/usr/bin/env bash
# Programm: HalloWelt.sh
# Version: 1.0
# Autor: TKluser
# Datum: 08.09.2021
# Lizenz: MIT
# Beschreibung: <TODO>

#region Functions

function is_num {
    # string - string to test
    REGEX='^[0-9]+$'
    if [[ $1 =~ $REGEX ]]; then
        true
    else
        false
    fi
}

function is_decimal {
    # string - string to test
    REGEX='^[0-9]+(\.[0-9]+$|$)'
    if [[ $1 =~ $REGEX ]]; then
        true
    else
        false
    fi
}

function is_str {
    # string - string to test
    REGEX='[A-Za-z0-9_]+'
    if [[ $1 =~ $REGEX ]]; then
        true
    else
        false
    fi
}

function file_exists {
    # file
    if [[ -f "$1" && -n "$1" ]]; then
        true
    else
        false
    fi
}

function folder_exists {
    # folder
    if [[ -d "$1" && -n "$1" ]]; then
        true
    else
        false
    fi
}

function files_are_equal {
    # file - file 1
    # file - file 2
    diff $1 $2 &>/dev/null
    return $?
}

function file_contains {
    # file
    # expression - regex expression
    grep -e $2 $1 &>/dev/null
    return $?
}

function folder_empty {
    # folder - foldername
    if [[ -z "$(ls $1 2>/dev/null)" ]]; then
        true
    else
        false
    fi
}

function folder_contains {
    # folder
    # expression - or filename
    find $1 -printf "%f\n" | grep -e $2 &>/dev/null
    return $?
}

function kill_process {
    # string - process name
    kill $(ps -Alf | grep "$1" | tr -s [:blank:] '\t' | head -n1 | cut -f4) &>/dev/null
    return $?
}

function get_file_line {
    # file
    # line - line number
    sed "$2q;d" $1
}

USER_INPUT=""
function get_input {
    # string - prompt to show
    echo -n "$1: "
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

function set_var {
    # string - var name
    # string - var value
    printf -v "$1" "%s" "$2"
}

function get_filename {
    # string - full file path
    basename $1
}

function validate_param {
    # string - var name
    # string - var value
    if [[ $1 =~ _dir$ ]]; then
        folder_exists $2
        return $?
    elif [[ $1 =~ _file$ ]]; then
        file_exists $2
        return $?
    elif [[ $1 =~ _num$ || $1 =~ _int$ ]]; then
        is_num $2
        return $?
    elif [[ $1 =~ _decimal$ || $1 =~ _dec$ ]]; then
        is_dec $2
        return $?
    elif [[ $1 =~ _string$ || $1 =~ _str$ ]]; then
        is_str $2
        return $?
    fi
}

function validate_params {
    for i in ${!PARAMS[@]}; do
        param=${PARAMS[$i]}
        value=${!param}
        if ! $(validate_param $param $value); then
            print_usage
            script_error
        fi
    done
}

function script_error {
    exit 1
}

function script_success {
    exit 0
}

function print_usage {
    echo "usage: $0 ${PARAMS[*]}" # string / num / decimal / dir / file
}

#endregion Functions

PARAMS=("folder1_dir" "folder2_dir")
INTERACTIVE=true
if [[ $# -ne ${#PARAMS[@]} ]]; then
    if [[ "$INTERACTIVE" = "true" ]]; then
        # for every param ask for user input
        for i in ${!PARAMS[@]}; do
            PARAM_NAME="${PARAMS[$i]}"
            get_input ${PARAMS[$i]}
            set_var $PARAM_NAME $USER_INPUT
        done
    else
        echo "error: not all paramters specified"
        print_usage
        script_error
    fi
else
    # set all params to corresponding param variable
    for i in ${!PARAMS[@]}; do
        PARAM_NAME="${PARAMS[$i]}"
        index=$((i + 1))
        VALUE=${!index}
        set_var $PARAM_NAME $VALUE
    done
fi

# Parameter validation based on type
validate_params

# Further Parameter validation
if $(folder_empty $folder2_dir); then
    echo "error: folder2_dir cannot be empty"
    script_error
fi

#region Main Code

if $(folder_contains _test/ "log.log"); then
    echo "folder contains"
fi

if $(file_contains hallo.txt ".*ha.*"); then
    echo "file contains"
fi

#endregion Main Code

# Script End
read -p "Press any key to continue ..." -n 1 -t 10
script_success
