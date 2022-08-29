## Set values
# Hide welcome message
set fish_greeting
set VIRTUAL_ENV_DISABLE_PROMPT "1"
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

# Set settings for https://github.com/franciscolourenco/done
set -U __done_min_cmd_duration 10000
set -U __done_notification_urgency_level low


# Add ~/.local/bin to PATH
if test -d ~/.local/bin
    if not contains -- ~/.local/bin $PATH
        set -p PATH ~/.local/bin
    end
end

# Add depot_tools to PATH
if test -d ~/Applications/depot_tools
    if not contains -- ~/Applications/depot_tools $PATH
        set -p PATH ~/Applications/depot_tools
    end
end

# Add cargo to PATH
if test -d ~/.cargo/bin
    if not contains -- ~/.cargo/bin $PATH
        set -p PATH ~/.cargo/bin
    end
end

# Add Ghidra to PATH
if test -d ~/Hacking/Ghidra
    if not contains -- ~/Hacking/Ghidra $PATH
        set -p PATH ~/Hacking/Ghidra
    end
end

# Set variables for valgrind
export DEBUGINFOD_URLS="https://debuginfod.archlinux.org"

## Starship prompt
source (starship init fish --print-full-init | psub)


## Functions
# Functions needed for !! and !$ https://github.com/oh-my-fish/plugin-bang-bang
function __history_previous_command
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function __history_previous_command_arguments
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end

if [ "$fish_key_bindings" = fish_vi_key_bindings ];
  bind -Minsert ! __history_previous_command
  bind -Minsert '$' __history_previous_command_arguments
else
  bind ! __history_previous_command
  bind '$' __history_previous_command_arguments
end

# Fish command history
function history
    builtin history --show-time='%F %T '
end

function backup --argument filename
    cp $filename $filename.bak
end

# Copy DIR1 DIR2
function copy
    set count (count $argv | tr -d \n)
    if test "$count" = 2; and test -d "$argv[1]"
	set from (echo $argv[1] | trim-right /)
	set to (echo $argv[2])
        command cp -r $from $to
    else
        command cp $argv
    end
end

# ls after cd
function cd
    if count $argv > /dev/null
        builtin cd "$argv"; and ls
    else
        builtin cd ~; and ls
    end
end

## Useful aliases
# Replace ls with exa
alias ls='exa -alh --color=always --group-directories-first --icons' # preferred listing
alias la='exa -a --color=always --group-directories-first --icons'   # all files and dirs
alias ll='exa -l --color=always --group-directories-first --icons'   # long format
alias lt='exa -aT --color=always --group-directories-first --icons'  # tree listing
alias l.="exa -a | egrep '^\.'"                                      # show only dotfiles

# Replace some more things with better alternatives
alias cat='bat' #--style header --style rules --style snip --style changes --style header'

# Common use
alias grubup="sudo update-grub"
alias tarnow='tar -acf '
alias untar='tar -zxvf '
alias wget='wget -c '
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias hw='hwinfo --short'                                   # Hardware Info
alias big="expac -H M '%m\t%n' | sort -h | nl"              # Sort installed packages according to size in MB

# Get fastest mirrors 
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist" 
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist" 
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist" 
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist" 

# Help people new to Arch
alias helpme='cht.sh --shell'
alias please='sudo'
alias tb='nc termbin.com 9999'
alias paru="paru --bottomup"

# Get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

# Pacman Aliases
alias pinstall="sudo pacman -S"
alias psearch="pacman -Ss"
alias pupgrade="sudo pacman -Syu"
alias premove="sudo pacman -Rns"
alias pfix="sudo rm /var/lib/pacman/db.lck"
alias cleanup="sudo pacman -Rns (pacman -Qtdq)"

# Recent installed packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"

#Open Fish Config
alias fishconfig="vim ~/.config/fish/config.fish"

#Python aliases
alias py=python3
alias py2=python2

# Launch Obsidian
alias obsidian="obsidian 1> /dev/null 2> /dev/null" 

#Setup Emscripten Environment
alias emsdk_setup="source ~/Code/emsdk/emsdk_env.fish"

## Import colorscheme from 'wal' asynchronously
if type "wal" >> /dev/null 2>&1
   cat ~/.cache/wal/sequences
end

## Start ssh-agent
fish_ssh_agent
alias buttconnect="ssh butt_sahab\\\buttw@buttsahab.com"

## Run neofetch if session is interactive
if status --is-interactive
   neofetch --ascii_distro arch
end

