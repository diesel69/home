### sd
HISTSIZE=10000		# Розмір історії команд термінала. Типово 500
HISTIGNORE="ls:mc:top:rm:rmdir"	# Не писати в файл історії перелічені команди 
HISTCONTROL=ignorespace:ignoredups	# Не писати в файл історії команди, що починаються пробілом (ignorespace), не писати команду, що повторює попередню (ignoredups)
export PROMPT_COMMAND='history -a'	# Запис команд в файл історії НЕГАЙНО. Типово - по завершенні поточної сесії

# Разрешающие настройки:
#Делаем возможным использование маски. Позволяет использовать конструкцию вида ** которая обозначает все файлы, начиная с текущего каталога. Очень полезно бывает для поиска определенных файлов. Например для того чтобы просмотреть все файлы в домашнем каталоге с расширением flv мне в домашнем каталоге достаточно набрать ls **/*.flv Так же удобно находить и другие файлы. Например свою коллекцию музыки в mp3 формате.
shopt -s globstar 

# shopt -s nullglob	# не принимать шаблон в сценарии за имя файла если в каталоге нет ни одного файла, соответствующего шаблону 
shopt -s cdspell            #исправление опечаток в параметрах команды cd
shopt -s cdable_vars
shopt -s checkhash
shopt -s checkwinsize
shopt -s mailwarn
shopt -s sourcepath
shopt -s no_empty_cmd_completion  # только для bash>=2.04
shopt -s cmdhist			# не разрывать многострочные команды
shopt -s histappend histreedit histverify
shopt -s extglob


# Не перетинати межі поточної файлової системи (-xdev). 
# Корисно, якщо використовуєте аргумент -delete,  щоб не видалити зайвого
# alias find='find -xdev'


alias mkdir='mkdir -p'	# Створює ланцюжок каталогів рекурсивно
alias rm='rm -i'		# Попереджує про видалення або перезапис існуючого файла
alias cp='cp -i'
alias mv='mv -i'

alias ..='cd ..'
alias du='du -h'
alias df='df -Th'
alias inxi='inxi -F'
# alias pgrep='pgrep -l'




# Различные варианты 'ls' (предполагается, что установлена GNU-версия ls)
alias ll='ls -al'
alias la='ls -Al'               # показать скрытые файлы
#alias ls='ls -hF --color'      # выделить различные типы файлов цветом
alias lx='ls -lXB'              # сортировка по расширению
alias lk='ls -lSr'              # сортировка по размеру
alias lc='ls -lcr'              # сортировка по времени изменения
alias lr='ls -lR |more'         # рекурсивный обход подкаталогов с выводом через 'more'
alias lt='ls -ltr'              # сортировка по дате
alias lm='ls -al |more'         # вывод через 'more'
#alias tree='tree -Csu' 


### sd
#-------------------
# Функции
# http://www.opennet.ru/docs/RUS/bash_scripting_guide/a15124.html
#-------------------
############################
function ii()   # Дополнительные сведения о системе
{

#    echo -e "\nІнформація про систему:$NC " ; uname -a
#    echo -e "\n${RED}Користувачі в системі:$NC " ; w -h
#    echo -e "\n${RED}Дата:$NC " ; date

   echo ===========  uname -a
uname -a

   echo ===========  date
date

   echo ===========  ip
wget -O - -q icanhazip.com

    echo =========== uptime 
uptime

    echo =========== free -m пам’ять, Мб
free -m
   
    echo =========== df -m диск, Мб
df -m

}
######################


### sd
#### Розфарбовуємо man ############
man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[38;5;246m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    man "$@"
}
### sd
#### Переназначаємо заголовок терміналу ### http://rus-linux.net/MyLDP/MINI-HOWTO-ru/Xterm-Title.html
#### nano /etc/bash.bashrc - для всіх користувачів
# PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
# Або:
# Commented out, don't overwrite xterm -T "title" -n "icontitle" by default.
# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
    ;;
*)
    ;;
esac

### sd
#### Переназначаємо розфарбовування командного рядка (на кожній машині - свій колір)
#### nano /etc/bash.bashrc - для всіх користувачів
#### nano ~/.bashrc - для конкретного користувача
#### Командний рядок Background - Red
#PS1="\[\033[41m\]\u@\h\[\033[0m\] \[\033[1;34m\]\W \$ \[\033[0m\]"
#### Командний рядок Background - Green
#PS1="\[\033[42m\]\u@\h\[\033[0m\] \[\033[1;34m\]\W \$ \[\033[0m\]"
#### Командний рядок Background - Yellow
#PS1="\[\033[43m\]\u@\h\[\033[0m\] \[\033[1;34m\]\W \$ \[\033[0m\]"
#### Командний рядок Background - Purple
#PS1="\[\033[45m\]\u@\h\[\033[0m\] \[\033[1;34m\]\W \$ \[\033[0m\]"
#### Командний рядок Background - Cyan
#PS1="\[\033[46m\]\u@\h\[\033[0m\] \[\033[1;34m\]\W \$ \[\033[0m\]"
#### Командний рядок Bold - Yellow
#PS1="\[\033[1;33m\]\u@\h:\[\e[01;34m\]\w \$ \[\033[0m\]"
#### Командний рядок Bold - Green
#PS1="\[\033[1;32m\]\u@\h:\[\e[01;34m\]\w \$ \[\033[0m\]"
#### Командний рядок Bold - Red
#PS1="\[\033[1;31m\]\u@\h:\[\e[01;34m\]\w \$ \[\033[0m\]"


### sd
# http://alv.me/?p=42 Інтерактивна підстановка аргументів (TAB, потім стрілка вгору-вниз)
# enable bash completion in interactive shells
if [ -f /etc/bash_completion ]; then
 . /etc/bash_completion
fi

