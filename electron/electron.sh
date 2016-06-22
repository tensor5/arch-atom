#!/usr/bin/bash

export GDK_BACKEND=x11
exec /usr/lib/electron/electron "$@"
