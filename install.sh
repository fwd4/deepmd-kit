#source ~/aicompiler/bladedisc/workspace/venv/bin/activate
export DP_VARIANT=rocm
export ROCM_ROOT=/opt/rocm-5.1.0/
rm -rf  _skbuild
pip install .

