#!/bin/sh

dirtemp="${dirtemp:-$HOME/.ao-libre-linux}"
repo="${repo:-EmilianoSalcedo/ao-libre-linux}"
remote="${remote:-https://github.com/${repo}.git}"
branch="${branch:-master}"

git clone --branch "${branch}" "${remote}" "${dirtemp}"
cd "${dirtemp}"

sh ./wine-installer.sh
sh ./wine-config.sh
sh ./cliente-installer.sh

rm -rf "${dirtemp}"

sh ./run.sh

