# chris's prompt

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}(%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%})"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%}*"
ZSH_THEME_GIT_PROMPT_CLEAN=""


# PROMPT='${ret_status}%{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'
PROMPT='%{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info) %{$fg_bold[blue]%}$ %{$reset_color%}'

# RPROMPT='%{$fg[grey]%}$(rbenv_prompt_info)%{$reset_color%}'

# Loads rvm info to the right side of the zsh prompt showing: ruby-version@gemset-name
RPROMPT='$(~/.rvm/bin/rvm-prompt)'
