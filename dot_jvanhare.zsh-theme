OS="$(uname -s)"
ARCHI="$(uname -m)"

get_guix_environment() {
  if [[ -n "$GUIX_ENVIRONMENT" ]]; then
    echo " [guix]"
  fi
}

set_prompt() {
  PROMPT="%(?:%{$fg_bold[green]%}%1{➜%} :%{$fg_bold[red]%}%1{➜%})%{$fg[magenta]%}[${OS}/${ARCHI}/%m]%{$reset_color%}%{$fg[yellow]%}$(get_guix_environment)%{$reset_color%} %{$fg[cyan]%}%c%{$reset_color%}"
  PROMPT+=' $(git_prompt_info)'
}

set_prompt

autoload -Uz add-zsh-hook
add-zsh-hook precmd set_prompt

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}%1{✗%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
