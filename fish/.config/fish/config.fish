#set -x PATH "/usr/local/opt/coreutils/libexec/gnubin" $PATH
#set -x PATH "/usr/local/opt/grep/libexec/gnubin" $PATH
#set -x MANPATH "/usr/local/opt/coreutils/libexec/gnuman" $PATH
set -x PATH $PATH "$HOME/.git-radar"
set -x PATH $PATH "$HOME/.pyenv/bin"
#set -x PATH $PATH "$HOME/.jenv"
set -x EDITOR "/usr/bin/vim"

#fzf
set -x FZF_DEFAULT_COMMAND "rg --files --hidden"
set -x FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND

#rg
set -x RIPGREP_CONFIG_PATH "$HOME/.rgrc"

set -x GOPATH "$HOME/go"

alias ls="ls --color=always"
alias grep="grep --color=always"
alias egrep="egrep --color=always"
alias k="kubectl"
alias kubectx="kubectl config current-context"

abbr --add fuckit "git add . --all; git commit -m '.'"

status --is-interactive; and source (rbenv init -|psub)
#status --is-interactive; and source (jenv init -| psub)

# i hate this piece of shit language
set -g fish_user_paths "/usr/local/opt/icu4c/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/icu4c/sbin" $fish_user_paths

status --is-interactive; and source (pyenv init -| psub)

# Plum GPG

set -x GPG_TTY (tty)
set -x SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

# End GPG Block

function fish_prompt
  if set -q VIRTUAL_ENV
    echo -n -s (set_color brwhite) "(" (basename "$VIRTUAL_ENV") ") "
  end
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
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths

eval (direnv hook fish)

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/opt/google-cloud-sdk/path.fish.inc' ]; . '/opt/google-cloud-sdk/path.fish.inc'; end
