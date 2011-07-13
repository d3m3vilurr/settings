#!bash
#
# hg-flow-completion
# ===================
# 
# Bash completion support for [hg-flow](http://bitbucket.org/nvie/hgflow)
# 
# The contained completion routines provide support for completing:
# 
#  * hg-flow init and version
#  * feature, hotfix and release branches
#  * remote feature branch names (for `hg-flow feature track`)
# 
# 
# Installation
# ------------
# 
# To achieve hg-flow completion nirvana:
# 
#  0. Install hg-completion.
# 
#  1. Install this file. Either:
# 
#     a. Place it in a `bash-completion.d` folder:
# 
#        * /etc/bash-completion.d
#        * /usr/local/etc/bash-completion.d
#        * ~/bash-completion.d
# 
#     b. Or, copy it somewhere (e.g. ~/.hg-flow-completion.sh) and put the following line in
#        your .bashrc:
# 
#            source ~/.hg-flow-completion.sh
# 
# The Fine Print
# --------------
# 
# Original: git-flow-completion
#     Copyright (c) 2010 [Justin Hileman](http://justinhileman.com) 
#
# Distributed under the [MIT License](http://creativecommons.org/licenses/MIT/)

_hg_cmd_flow ()
{
    local i subcmd

    # find the sub-command
    for ((i=cmd_index+1; i<=COMP_CWORD; i++)); do
    if [[ ${COMP_WORDS[i]} != -* ]]; then
        if [[ ${COMP_WORDS[i-1]} != @($global_args) ]]; then
        subcmd="${COMP_WORDS[i]}"
        break
        fi
    fi
    done

    if [ -z "$subcmd" ] || [ $COMP_CWORD -eq $i ] || [ "$subcmd" = help ]; then
    COMPREPLY=(${COMPREPLY[@]:-}
           $(compgen -W 'init feature release hotfix' -- "$cur"))
    return
    fi

    case "$subcmd" in
    feature)
        __hg_cmd_flow_feature
        return
        ;;
    release)
        __hg_cmd_flow_release
        return
        ;;
    hotfix)
        __hg_cmd_flow_hotfix
        return
        ;;
    *)
        COMPREPLY=()
    esac

    return
}

__hg_cmd_flow_feature ()
{
    local i subcmd

    # find the sub-command
    for ((i=cmd_index+2; i<=COMP_CWORD; i++)); do
    if [[ ${COMP_WORDS[i]} != -* ]]; then
        if [[ ${COMP_WORDS[i-1]} != @($global_args) ]]; then
        subcmd="${COMP_WORDS[i]}"
        break
        fi
    fi
    done

    if [ -z "$subcmd" ] || [ $COMP_CWORD -eq $i ] || [ "$subcmd" = help ]; then
    COMPREPLY=(${COMPREPLY[@]:-}
           $(compgen -W 'start finish change' -- "$cur"))
    return
    fi

    case "$subcmd" in
    finish|change|close)
        #__hgcomp "$(__hg_flow_list_features)"
        __hg_cmd_flow_feature_finish
        return
        ;;
    *)
        COMPREPLY=()
        ;;
    esac
}

__hg_cmd_flow_feature_finish ()
{
    local i subcmd

    # find the sub-command
    for ((i=cmd_index+3; i<=COMP_CWORD; i++)); do
    if [[ ${COMP_WORDS[i]} != -* ]]; then
        if [[ ${COMP_WORDS[i-1]} != @($global_args) ]]; then
        subcmd="${COMP_WORDS[i]}"
        break
        fi
    fi
    done

    if [ -z "$subcmd" ] || [ $COMP_CWORD -eq $i ] || [ "$subcmd" = help ]; then
    local branches="$("$hg" branches -q 2>/dev/null|egrep '^feature\/'|sed 's/^feature\///g'|awk '{print $1 }'|sort)"
    local IFS=$'\n'
    COMPREPLY=(${COMPREPLY[@]:-} $(compgen -W '$branches' -- "$cur"))
    return
    fi

    case "$subcmd" in
    *)
        COMPREPLY=()
        ;;
    esac
}

__hg_cmd_flow_release ()
{
    local i subcmd

    # find the sub-command
    for ((i=cmd_index+2; i<=COMP_CWORD; i++)); do
    if [[ ${COMP_WORDS[i]} != -* ]]; then
        if [[ ${COMP_WORDS[i-1]} != @($global_args) ]]; then
        subcmd="${COMP_WORDS[i]}"
        break
        fi
    fi
    done

    if [ -z "$subcmd" ] || [ $COMP_CWORD -eq $i ] || [ "$subcmd" = help ]; then
    COMPREPLY=(${COMPREPLY[@]:-}
           $(compgen -W 'start finish' -- "$cur"))
    return
    fi

    case "$subcmd" in
    finish)
        __hg_cmd_flow_release_finish
        return
        ;;
    *)
        COMPREPLY=()
        ;;
    esac

}

__hg_cmd_flow_release_finish ()
{
    local i subcmd

    # find the sub-command
    for ((i=cmd_index+3; i<=COMP_CWORD; i++)); do
    if [[ ${COMP_WORDS[i]} != -* ]]; then
        if [[ ${COMP_WORDS[i-1]} != @($global_args) ]]; then
        subcmd="${COMP_WORDS[i]}"
        break
        fi
    fi
    done

    if [ -z "$subcmd" ] || [ $COMP_CWORD -eq $i ] || [ "$subcmd" = help ]; then
    local branches="$("$hg" branches -q 2>/dev/null|egrep '^release\/'|sed 's/^release\///g'|awk '{print $1 }'|sort)"
    local IFS=$'\n'
    COMPREPLY=(${COMPREPLY[@]:-} $(compgen -W '$branches' -- "$cur"))
    return
    fi

    case "$subcmd" in
    *)
        COMPREPLY=()
        ;;
    esac
}

__hg_cmd_flow_hotfix ()
{
    local i subcmd

    # find the sub-command
    for ((i=cmd_index+2; i<=COMP_CWORD; i++)); do
    if [[ ${COMP_WORDS[i]} != -* ]]; then
        if [[ ${COMP_WORDS[i-1]} != @($global_args) ]]; then
        subcmd="${COMP_WORDS[i]}"
        break
        fi
    fi
    done

    if [ -z "$subcmd" ] || [ $COMP_CWORD -eq $i ] || [ "$subcmd" = help ]; then
    COMPREPLY=(${COMPREPLY[@]:-}
           $(compgen -W 'start finish' -- "$cur"))
    return
    fi

    case "$subcmd" in
    finish)
        __hg_cmd_flow_hotfix_finish
        return
        ;;
    *)
        COMPREPLY=()
        ;;
    esac
}

__hg_cmd_flow_hotfix_finish ()
{
    local i subcmd

    # find the sub-command
    for ((i=cmd_index+3; i<=COMP_CWORD; i++)); do
    if [[ ${COMP_WORDS[i]} != -* ]]; then
        if [[ ${COMP_WORDS[i-1]} != @($global_args) ]]; then
        subcmd="${COMP_WORDS[i]}"
        break
        fi
    fi
    done

    if [ -z "$subcmd" ] || [ $COMP_CWORD -eq $i ] || [ "$subcmd" = help ]; then
    local branches="$("$hg" branches -q 2>/dev/null|egrep '^hotfix\/'|sed 's/^hotfix\///g'|awk '{print $1 }'|sort)"
    local IFS=$'\n'
    COMPREPLY=(${COMPREPLY[@]:-} $(compgen -W '$branches' -- "$cur"))
    return
    fi

    case "$subcmd" in
    *)
        COMPREPLY=()
        ;;
    esac
}

