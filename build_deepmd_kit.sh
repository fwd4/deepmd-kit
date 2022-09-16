#!/bin/sh 

TF_ROOT=/root/.venv/rocm/lib/python3.9/site-packages/tensorflow/
LP_ROOT=/root/lammps/lammps-stable_29Sep2021_update3
DPMD_ROOT=/root/deepmd-kit
ROCM_ROOT=/opt/rocm-5.2.0

(
cd $DPMD_ROOT
DP_VARIANT=rocm pip install .

mkdir -p source/build
cd source/build
cmake .. -DTENSORFLOW_ROOT=$TF_ROOT \
         -DLAMMPS_SOURCE_ROOT=$LP_ROOT \
         -DLAMMPS_VERSION_NUMBER=20210929 \
         -DCMAKE_INSTALL_PREFIX=/usr/local \
         -DUSE_ROCM_TOOLKIT=1 \
	 -DROCM_ROOT=/opt/rocm-5.2.0

make -j
make install
make lammps

cp -rf USER-DEEPMD $LP_ROOT/src/

cd $LP_ROOT/src/
make clean-all
make yes-kspace
make yes-user-deepmd
make serial -j
ln -sf $PWD/lmp_serial /usr/local/bin/
)
