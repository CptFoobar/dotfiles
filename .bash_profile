export JAVA_HOME=$(/usr/libexec/java_home)



# added by Anaconda3 2019.07 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/anaconda3/etc/profile.d/conda.sh" ]; then
# . "/anaconda3/etc/profile.d/conda.sh"  # commented out by conda initialize
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<

export PATH="/Users/sidhantsharma/Software/apache-maven-3.6.1/bin:$PATH"
# export HADOOP_HOME="/usr/local/opt/hadoop"
# export HADOOP_CONF_DIR=${HADOOP_HOME}/etc/hadoop
# export HADOOP_COMMON_HOME=$HADOOP_HOME
# export PATH=$PATH:$HADOOP_HOME/sbin:$HADOOP_HOME/bin

# aliases
alias ll="ls -lhaG"
alias lar="ls -lhaRG"
alias py=python3
alias psp="/Users/sidhantsharma/Lab/Scripts/psp.py"
alias circ="/Users/sidhantsharma/Lab/Scripts/circles.py"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('//anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "//anaconda3/etc/profile.d/conda.sh" ]; then
        . "//anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="//anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
alias c=clear
alias q=exit
scripts="/Users/sidhantsharma/Lab/Scripts"
alias gs="git status"

if [ -f ~/.aliases ]; then 
    source ~/.aliases
fi

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
