#!/usr/bin/env bash

c_cyan=`tput setaf 6`
c_red=`tput setaf 1`
c_green=`tput setaf 2`
c_pink=`tput setaf 5`
c_sgr0=`tput sgr0`
 
parse_branch ()
{
   if git rev-parse --git-dir >/dev/null 2>&1
   then
      branchname="\x20(git:"$(branch_color)$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')${c_sgr0}") "
   elif hg prompt >/dev/null 2>&1
   then
      branchname="\x20(hg:"$(branch_color)$(hg prompt "{branch}" 2>/dev/null)${c_sgr0}") "
   else
      return 0
   fi
   echo -e $branchname
}
 
branch_color ()
{
   if git rev-parse --git-dir >/dev/null 2>&1
   then
      color=""
      if git diff --quiet 2>/dev/null >&2
      then
         gitstatus=$(git status --short 2>/dev/null| tail -n1| wc -l)
         case "$gitstatus" in
            "0" ) color=${c_green};;
            * ) color=${c_pink};;
         esac
      else
         color=${c_red}
      fi
   elif hg prompt >/dev/null 2>&1
   then
      color=""
      hgstatus=$(hg prompt {status} 2>/dev/null)
      case "$hgstatus" in
         "!" ) color=${c_red};;
         "?" ) color=${c_pink};;
         *       ) color=${c_green};;
      esac
   else
      return 0
   fi
   echo -ne $color
}

PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$(parse_branch)\n\$ '

