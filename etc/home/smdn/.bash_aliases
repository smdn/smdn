alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ls='ls -F --color=auto'

if [[ -x `which git` ]]; then
  alias diff='git --no-pager diff --no-index --color'
else
  alias diff='diff -u'
fi
