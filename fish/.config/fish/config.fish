set -x PATH "/usr/local/opt/coreutils/libexec/gnubin" $PATH
set -x MANPATH "/usr/local/opt/coreutils/libexec/gnuman" $PATH
set -x PATH $PATH "$HOME/.git-radar"
set -x EDITOR "/usr/bin/vim"

alias ls="ls --color=always"
alias grep="grep --color=always"
alias egrep="egrep --color=always"
alias k="kubectl"

abbr --add consume-bom="kafka-console-consumer --bootstrap-server=bom-central-kafka-1.srv.glispa.com:9092"
abbr --add consume-leap="kafka-console-consumer --bootstrap-server=leap-central-kafka-1.srv.glispa.com:9092"
abbr --add consume-stage-bom="kafka-console-consumer --bootstrap-server=stage-bom-central-kafka-1-n15.srv.glispa.com:9092"
abbr --add consume-stage-leap="kafka-console-consumer --bootstrap-server=stage-leap-kafka-central-1.int.glispa.com:9092"
abbr --add fuckit="git add . --all; git commit -m '.'"

status --is-interactive; and source (rbenv init -|psub)

function fish_prompt
  set_color green
  echo -n (whoami)
  echo -n ' @ '
  set_color yellow --underline
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
set -g fish_user_paths "/usr/local/opt/scala@2.12/bin" $fish_user_paths