# ~/.bashrc: executed by bash(1) for non-login shells.

# Note: PS1 and umask are already set in /etc/profile. You should not
# need this unless you want different defaults for root.
# PS1='${debian_chroot:+($debian_chroot)}\h:\w\$ '
# umask 022




#COLORS!!!
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'


# Some alias to avoid making mistakes:
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# some more ls aliases
alias ll='ls -l'
alias la='ls -Al'
alias lss='ls -ls'
alias las='ls -Als'
#alias l='ls -CF'



# APT alias
alias apt-inst='sudo apt install'
alias apt-unst='sudo apt -t unstable install'
_apt_install_complete() { 
	mapfile -t COMPREPLY < <(apt-cache --no-generate pkgnames "$2");
}
complete -F _apt_install_complete apt-inst apt-unst 'apt show'

alias apt-aurm='sudo apt autoremove'
alias apt-rm='sudo apt remove'
#_apt_remove_complete() {
#	mapfile -t COMPREPLY < <(apt-cache --no-generate pkgnames "$2");
#}
#TODO: make this installed only
complete -F _apt_install_complete apt-rm apt-aurm

alias apt-upd='sudo apt update'
alias apt-upg='sudo apt update && sudo apt dist-upgrade'
alias apt-mark-auto='sudo apt-mark auto'


# Personal programming aliases
alias py=python3
alias pip=pip3
alias v=vim

# other
alias i3config='vim ~/.config/i3/config'
#alias pape='~/.config/scripts/i3wp'
alias lock=i3lock-fancy
alias feh-i3='feh --scale-down --auto-zoom'
alias ftp-passive='ftp -p'


alias nyancat='pygmentize -g'
alias rice='neofetch && scrot'


alias reboot='sudo reboot'
alias shutdown='sudo shutdown now'



