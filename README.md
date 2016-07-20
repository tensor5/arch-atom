This repository contains `PKGBUILD`s and related files necessary to build Atom
and Electron binary packages for [Arch Linux][arch]. Pre-built packages are
available by enabling `[atom]` repository in `/etc/pacman.conf`:

```sh
[atom]
Server = http://noaxiom.org/$repo/$arch
```

You should also add the repo's key to your trusted keys:

```sh
sudo pacman-key -r B0544167
sudo pacman-key --lsign-key B0544167
```

Check the Arch [wiki][atom-wiki] for more information.

# Build method

Our method of building Atom is slightly different from the one officially
recommended by the Atom team.

If you follow [Atom build instructions][atom-build], the build system will
download a binary copy of Electron and include it in your distribution. If you
follow [Electron build instructions][electron-build], it will use a binary copy
of [libchromiumcontent][libchromiumcontent], the library upon which Electron is
based.

Our packages, on the other hand, are entirely built for source.

Another difference with upstream builds is that they ship Atom, Electron and apm
(the Atom package manager) all in one distribution, and they rename the
`electron` executable as `atom`. We ship three distinct packages named atom,
electron and nodejs-atom-package-manager, and the atom package depends on the
other two. Moreover, nodejs-atom-package-manager uses the system nodejs
installation, rather than downloading a binary node executable as the official
build does.

[arch]: https://www.archlinux.org/ "Arch Linux"
[atom-build]: https://github.com/atom/atom/blob/master/docs/build-instructions/linux.md
[atom-wiki]: https://wiki.archlinux.org/index.php/Atom "Atom - ArchWiki"
[electron-build]: https://github.com/atom/electron/blob/master/docs/development/build-instructions-linux.md
[libchromiumcontent]: https://github.com/atom/libchromiumcontent
