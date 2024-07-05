#!/bin/bash
basedir=$(cd $(dirname $0) && pwd)
backup_suffix=.original~
COPY="rsync --verbose --backup --suffix=${backup_suffix} --checksum --perms --times"

# copy dotfiles to ${HOME}
${COPY} \
  ${basedir}/.vimrc \
  ${basedir}/.bash_aliases \
  ${basedir}/.bash_prompt \
  ${basedir}/.bash_envname \
  ${HOME}

# copy .bashrc from /etc/skel and apply the patch
PATCH_FILE_BASHRC=${basedir}/.bashrc.ubuntu.patch
PATCH_ARGS_BASHRC="--directory=${HOME} --forward --backup-if-mismatch --suffix=${backup_suffix}"

cp --force --backup=numbered /etc/skel/.bashrc ${HOME}/.bashrc

patch --dry-run ${PATCH_ARGS_BASHRC} < ${PATCH_FILE_BASHRC}

if [ $? -eq 0 ]; then
  patch ${PATCH_ARGS_BASHRC} < ${PATCH_FILE_BASHRC}
fi

# deploy git-prompt.sh
curl -L https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh --output ${HOME}/.git-prompt.sh

# copy dotfiles to ${HOME}/.config
if [ $EUID -ne 0 ]; then
  destdir=${HOME}/.config
  mkdir -p ${destdir}
  ${COPY} \
    ${basedir}/.config/user-dirs.conf \
    ${basedir}/.config/user-dirs.dirs \
    ${basedir}/.config/user-dirs.locale \
    ${destdir}
fi

