DEFAULT_USER="json"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
ZSH_THEME="powerlevel10k/powerlevel10k"

# P9K_MODE='awesome-patched'
P9K_MODE='nerdfont-complete'
P9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
P9K_RIGHT_PROMPT_ELEMENTS=(vi_mode status root_indicator background_jobs history time)
POWERLEVEL9K_EXPERIMENTAL_TIME_REALTIME=false # This causes a bug with autocomplete

# POWERLEVEL9K Mode Info (old master branch)
# POWERLEVEL9K_MODE='awesome-patched'
# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vi_mode status root_indicator background_jobs history time)

# POWERLEVEL 9K Defaults
# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir)
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history time)
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vi_mode_alt status root_indicator background_jobs history time)

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/json/.oh-my-zsh"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(autojump)
plugins=(git autojump command-not-found httpie pip python vi-mode yarn)

source $ZSH/oh-my-zsh.sh

# Aliases
source ~/.aliasrc

# unsetopt BG_NICE # This is required in Windows 10 to fix the Nice error

# Check for Trash
# source ~/scripts/checkForTrash.zsh

eval $(thefuck --alias) # Add alias for the "fuck" command
# eval `dircolors ~/dircolors-solarized/dircolors.256dark` # Set Directory Colors for ls

# Load Paths
# Adds `~/.scripts` and all subdirectories to $PATH
export PATH="$PATH:$(du "$HOME/scripts/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"

# Display Xwindows on WSL Linux
# export TERM="xterm-256color"
# export DISPLAY=localhost:0.0 # This BREAKS native linux...
# source ~/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme
export TERMINAL=/usr/bin/termite
