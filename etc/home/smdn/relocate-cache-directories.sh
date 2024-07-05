#!/bin/bash

# シンボリックリンクに置き換えるディレクトリ
DIRS=(".arduino15" ".cache" ".dotnet" ".npm" ".nuget" ".platformio" ".var" ".vscode" ".wine")

# リンク先のディレクトリ
CACHE_BASE_DIR=/srv/cache/users/${USER}

for d in "${DIRS[@]}"; do
  DIR=~/${d}
  CACHE_DIR=${CACHE_BASE_DIR}/${d}

  # すでにシンボリックリンクの場合は何もしない
  if [ ! -L ${DIR} ]; then
    # リンク先ディレクトリが無い場合は、先に作成して既存のファイルを移動する
    if [ ! -d ${CACHE_DIR} ]; then
      mkdir -p ${CACHE_DIR}
      rsync -a ${DIR} ${CACHE_DIR}/
    fi

    # 一旦実ディレクトリを退避したのち、シンボリックリンクを作成し、退避した実ディレクトリを削除
    TEMP_DIR=~/temp_${d}
    mv ${DIR} ${TEMP_DIR}
    ln -s ${CACHE_DIR} ${DIR}
    rm -rf ${TEMP_DIR}
  fi
done

