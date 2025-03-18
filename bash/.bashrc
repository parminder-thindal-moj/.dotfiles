export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/parminderthindal/.cache/lm-studio/bin"
