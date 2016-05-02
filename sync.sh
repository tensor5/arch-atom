#!/usr/bin/bash

repo_host='root@noaxiom.org'
repo_name='atom'
repo_path="/srv/noaxiom/${repo_name}"

rsync_args=('-rtlvH'
            '--delete-after'
            '--delay-updates'
            '--safe-links'
            '--max-delete=1000'
           )

arch='x86_64'
echo "Syncing ${arch} repository..."
if [ -d repository ]; then
    cd repository
    rsync "${rsync_args[@]}" . "${repo_host}:${repo_path}/${arch}"
fi
