#!/usr/bin/bash

pkgs=('apm'
      'atom'
      'electron'
     )

add=()

mkdir -p repository

for pkg in "${pkgs[@]}"; do
    source ${pkg}/PKGBUILD
    path="${pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.xz"
    if [ ! -e "repository/${path}" ]; then
        echo "Copying ${path}..."
        cp ${pkg}/${path} repository
        add+=("${path}")
    fi
    if [ ! -e "repository/${path}.sig" ]; then
        echo "Signing ${path}..."
        (cd repository; gpg2 --detach-sign ${path})
    fi
done

if [ ${#add[@]} -ne 0 ]; then
    cd repository
    add_args='--sign --verify --delta --remove'
    repo-add ${add_args} atom.db.tar.xz ${add[@]}
fi
