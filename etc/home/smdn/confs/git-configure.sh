#/bin/sh

# user
git config --global user.name "smdn"
git config --global user.email "smdn@smdn.jp"
git config --global user.signingkey 73C89F427887AFD024EEAB93295B1EBCF33A020E!

# defalt branch
git config --global --replace-all init.defaultBranch main

# GPG signing
git config --global gpg.program gpg
git config --global commit.gpgsign true
git config --global tag.gpgsign true

# core
git config --global core.editor "vi"
git config --global core.autocrlf input
git config --global core.safecrlf true
git config --global core.ignorecase false
git config --global core.quotepath false

# push
git config --global push.default simple

# pull
git config --global pull.ff only

# diff
git config --global diff.noprefix true

# color
git config --global color.ui true
git config --global color.diff.meta "bold yellow"
git config --global color.diff.frag "bold cyan"
git config --global color.diff.old "bold red"
git config --global color.diff.new "bold green"

# aliases
git config --global alias.logg "log --graph --all --date=iso --pretty=format:'%C(bold red)%h %C(bold green)%cd %C(bold magenta)[%G?]%C(bold yellow)%cn%Creset%x09%C(bold cyan)%d%Creset %s'"
git config --global alias.logd "log --name-status --all --date=iso-strict --pretty=format:'%C(bold green)%cd %C(bold yellow)%cn <%ce> %C(bold red)%H%n%C(bold magenta)%GG%n%C(bold cyan)%D%n%B'"
git config --global alias.tags "!f () { pattern=refs/tags/\$1; git for-each-ref --sort=taggerdate --format='%(color:bold red)%(objectname:short) %(color:bold green)%(taggerdate:iso) %(color:bold cyan)%(align:72)%(refname:short)%(end) %(color:bold yellow)%(taggername) %(color:reset)%(subject)' \$pattern; }; f"
git config --global alias.aliases '!git config --get-regexp "^alias\." | sed "s/alias\.\([^ ]*\) \(.*\)/\1\t => \2/"'
git config --global alias.branches "for-each-ref --sort=committerdate --format='%(color:bold red)%(objectname:short) %(color:bold green)%(committerdate:iso) %(color:bold red)%(HEAD)%(color:bold cyan)%(align:40)%(refname:short)%(end) %(color:bold yellow)%(committername) %(color:reset)%(subject)' refs/heads/ refs/remotes/"
git config --global alias.difff "diff --word-diff-regex='.' -U0"
git config --global alias.diffw "diff --word-diff"

# Windows specific configurations
if [[ -n "$USERPROFILE"  ]]; then
  git config --global sendpack.sideband false
  git config --global core.symlinks true
fi

