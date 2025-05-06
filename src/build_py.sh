#!/bin/bash

cd CTranslate2-rocm/python
. "/opt/conda/etc/profile.d/conda.sh"
conda activate py_3.12

pip install wheel setuptools pybind11

# export LDFLAGS="-L/usr/local/lib"
python setup.py bdist_wheel
pip install dist/*.whl --no-deps
