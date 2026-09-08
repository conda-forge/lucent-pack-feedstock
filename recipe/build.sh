#!/bin/bash

set -eux

pushd js
    npm ci
    npm run build
    mkdir -p ../src/lucent_pack/static/lucent/dist
    cp -r -v dist/* ../src/lucent_pack/static/lucent/dist/
popd

${PYTHON} -m pip install . -vvv
