### pyenv settings

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# run pyenv every time you open your prompt.
cd ~/
echo 'eval "$(pyenv init -)"' >> .bash_profile

# alias for pip3 to work with pyenv
echo "alias pip=/usr/local/bin/pip3" >> ~/.bashrc
# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/parminderthindal/.cache/lm-studio/bin"
