#!/usr/bin/node

process.env.ATOM_RESOURCE_PATH = process.env.ATOM_RESOURCE_PATH ||
        '/usr/lib/atom';

process.env.ATOM_ELECTRON_VERSION = process.env.ATOM_ELECTRON_VERSION ||
        require('fs')
    .readFileSync('/usr/lib/electron/version', 'utf8').trim().slice(1);

require('../lib/apm-cli.js')
    .run(process.argv.slice(2), (error) => process.exit(+!!error));
