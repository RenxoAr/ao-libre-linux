#!/bin/sh

dirtemp="${dirtemp:-$HOME/.ao-libre-linux}"
repo="${repo:-RenxoAr/ao-libre-linux}"
remote="${remote:-https://github.com/${repo}.git}"
branch="${branch:-master}"

git clone --branch "${branch}" "${remote}" "${dirtemp}"

sh "${dirtemp}"/wine-installer.sh
sh "${dirtemp}"/wine-config.sh
sh "${dirtemp}"/cliente-installer.sh
sh "${dirtemp}"/run.sh
