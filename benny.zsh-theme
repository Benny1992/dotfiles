# chris's prompt

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}(%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%})"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%}*"
ZSH_THEME_GIT_PROMPT_CLEAN=""

function rbenv_prompt_info() {
  local ruby_version
  ruby_version=$(rbenv version 2> /dev/null) || return
  echo "‹$ruby_version" | sed 's/[ \t].*$/›/'
}

alias rvm-prompt=rbenv_prompt_info
alias rvm_prompt_info=rbenv_prompt_info

# PROMPT='${ret_status}%{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'
PROMPT='%{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info) %{$fg_bold[blue]%}$ %{$reset_color%}'

RPROMPT='%{$fg[cyan]%}$(rbenv_prompt_info)%{$reset_color%}%'
