#set -x PATH "/usr/local/opt/coreutils/libexec/gnubin" $PATH
#set -x PATH "/usr/local/opt/grep/libexec/gnubin" $PATH
#set -x MANPATH "/usr/local/opt/coreutils/libexec/gnuman" $PATH
set -x PATH $PATH "$HOME/.git-radar"
set -x PATH $PATH "$HOME/.rbenv/bin"
set -x PATH $PATH "$HOME/go/bin" "/usr/local/go/bin"
set -x PATH $PATH "$HOME/.local/bin"
set -x PATH $PATH "/snap/bin"
set -x EDITOR "/usr/bin/vim"

#fzf
set -x FZF_DEFAULT_COMMAND "rg --files --hidden"
set -x FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND

#rg
set -x RIPGREP_CONFIG_PATH "$HOME/.rgrc"

alias ls="ls --color=always"
alias grep="grep --color=always"
alias egrep="egrep --color=always"
alias k="kubectl"

abbr --add fuckit "git add . --all; git commit -m '.'"

status --is-interactive; and source (rbenv init -|psub)

# fucking python
set -Ux PYENV_ROOT $HOME/.pyenv
set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths
pyenv init - | source
status --is-interactive; and pyenv virtualenv-init - | source

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
  set_color normal
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


# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
