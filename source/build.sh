cmake .. -DTENSORFLOW_ROOT=/opt/venv/lib/python3.6/site-packages/tensorflow -DUSE_ROCM_TOOLKIT=TRUE -DROCM_ROOT=/opt/rocm -DLAMMPS_SOURCE_ROOT=/home/fl237079/workspace/deepmd-kit/lammps/lammps-stable_29Sep2021_update3 -DLAMMPS_VERSION_NUMBER=20210929 -DCMAKE_INSTALL_PREFIX=/home/fl237079/workspace/deepmd-kit/install
#cmake .. -DTENSORFLOW_ROOT=/home/fl237079/workspace/tf_lib -DUSE_ROCM_TOOLKIT=TRUE -DROCM_ROOT=/opt/rocm
make -j 
make install
make lammps



