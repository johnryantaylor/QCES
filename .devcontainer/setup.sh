#!/usr/bin/env bash
# Install the Python packages and Dedalus for the QCES notebooks
set -e

# System libraries needed to build Dedalus (FFTW, MPI) and to make animations (ffmpeg)
sudo apt-get update
sudo apt-get install -y libfftw3-dev libfftw3-mpi-dev libopenmpi-dev ffmpeg

# Python packages
pip install -r requirements.txt

# Dedalus
export MPI_INCLUDE_PATH=/usr/lib/x86_64-linux-gnu/openmpi/include
export MPI_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu
export FFTW_INCLUDE_PATH=/usr/include
export FFTW_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu
CC=mpicc pip install --no-cache-dir --no-build-isolation dedalus

python -c "import dedalus.public; print('Dedalus installed')"
