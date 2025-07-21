#!/bin/bash
basedir=$(cd $(dirname $0) && pwd)
backup_suffix=.original~

if [ -x "$(command -v rsync)" ]; then
  COPY="rsync --verbose --backup --suffix=${backup_suffix} --checksum --perms --times"
else
  COPY="cp --verbose --force --suffix=${backup_suffix} --preserve=mode,ownership,timestamps"
fi

# copy dotfiles to ${HOME}
${COPY} \
  ${basedir}/.vimrc \
  ${basedir}/.bash_aliases \
  ${basedir}/.bash_prompt \
  ${basedir}/.bash_envname \
  ${HOME}

# copy .bashrc from /etc/skel and apply the patch
SKELETON_FILE_BASHRC=/etc/skel/.bashrc

if [ -f ${SKELETON_FILE_BASHRC} ]; then
  PATCH_FILE_BASHRC=${basedir}/.bashrc.ubuntu.patch
  PATCH_ARGS_BASHRC="--directory=${HOME} --forward --backup-if-mismatch --suffix=${backup_suffix}"

  cp --force --backup=numbered ${SKELETON_FILE_BASHRC} ${HOME}/.bashrc

  patch --dry-run ${PATCH_ARGS_BASHRC} < ${PATCH_FILE_BASHRC}

  if [ $? -eq 0 ]; then
    patch ${PATCH_ARGS_BASHRC} < ${PATCH_FILE_BASHRC}
  fi
else
  # copy skelton for Git Bash
  cp --force --backup=numbered ${basedir}/.bash_profile.git-bash ${HOME}/.bash_profile
  cp --force --backup=numbered ${basedir}/.bashrc.git-bash ${HOME}/.bashrc
fi

# deploy git-prompt.sh
if [ ! -f "${HOME}/.git-prompt.sh" ]; then
  curl -L https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh --output ${HOME}/.git-prompt.sh
fi

# copy dotfiles to ${HOME}/.config
if [ ! -n "$USERPROFILE" ] && [ $EUID -ne 0 ]; then
  destdir=${HOME}/.config
  mkdir -p ${destdir}
  ${COPY} \
    ${basedir}/.config/user-dirs.conf \
    ${basedir}/.config/user-dirs.dirs \
    ${basedir}/.config/user-dirs.locale \
    ${destdir}
fi
