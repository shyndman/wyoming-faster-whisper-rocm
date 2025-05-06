#!/usr/bin/env bash

. "/opt/conda/etc/profile.d/conda.sh"
conda activate py_3.12

exec python3 -m wyoming_whisper \
    --device cuda \
    --model distil-medium.en \
    --uri 'tcp://0.0.0.0:10300' \
    --data-dir /data \
    --download-dir /data \
    --debug \
    "$@"
