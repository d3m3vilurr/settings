function git_branch_color
    if git diff --quiet 2>/dev/null >&2
        switch (git status --short 2>/dev/null| tail -n1 | wc -l)
            case "0"
                set_color green
            case "*"
                set_color magenta
        end
    else
        set_color red
    end
end

function hg_branch_color
    if test (hg status | wc -l) -eq 0
        set_color green
        return
    end
    switch (hg prompt "{status}" 2>/dev/null)
        case "!"
            set_color red
        case "?"
            set_color magenta
    end
end

function is_git_repo
    if which git >/dev/null 2>&1
        if git rev-parse --git-dir >/dev/null 2>&1
            return 0
        end
    end
    return 1
end

function is_hg_repo
    if which hg >/dev/null 2>&1
        if hg prompt >/dev/null 2>&1
            return 0
        end
    end
    return 1
end

function print_branch
    set_color normal

    if is_git_repo
        printf " (git:"
        git_branch_color
        printf "%s" (git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')
        set_color normal
        printf ") "
        return
    else if is_hg_repo
        printf " (hg:"
        hg_branch_color
        printf "%s" (hg prompt "{branch}" 2>/dev/null)
        set_color normal
        printf ") "
    end
end

function fish_prompt
	set_color yellow
    printf '%s' (whoami)
    set_color normal
    printf ' at '

    set_color magenta
    printf '%s' (hostname|cut -d . -f 1)
    set_color normal

    if test $VIRTUAL_ENV
        printf " (%s)" (set_color blue)(basename $VIRTUAL_ENV)(set_color normal)
    end

    printf ' in '

    set_color $fish_color_cwd
    printf '%s' (prompt_pwd)
    set_color normal

    print_branch

    echo

    switch $USER
        case root; printf '# '
        case '*'; printf '> '
    end

    set_color normal
end
