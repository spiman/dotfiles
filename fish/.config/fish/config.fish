set -x PATH "/usr/local/opt/coreutils/libexec/gnubin" $PATH
set -x PATH "/usr/local/opt/grep/libexec/gnubin" $PATH
set -x MANPATH "/usr/local/opt/coreutils/libexec/gnuman" $PATH
set -x PATH $PATH "$HOME/.git-radar"
set -x PATH $PATH "$HOME/.jenv"
set -x EDITOR "/usr/bin/vim"

alias ls="ls --color=always"
alias grep="grep --color=always"
alias egrep="egrep --color=always"
alias k="kubectl"

abbr --add fuckit "git add . --all; git commit -m '.'"

#status --is-interactive; and source (rbenv init -|psub)

status --is-interactive; and source (jenv init -| psub)

function fish_prompt
  set_color brgreen
  echo -n (whoami)
  echo -n ' @ '
  set_color bryellow --underline
  echo -n (prompt_pwd)
  set_color normal
  echo (git-radar --fish --fetch)
  echo -n '# '
end

function sudo
    if test "$argv" = !!
        eval command sudo $history[1]
    else
        command sudo $argv
    end
end
