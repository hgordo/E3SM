#!/bin/bash
#
#   Jobscript for launching dcmip2016 test 1 on the NERSC Edison machine
#
# usage: sbatch jobscript-...

#SBATCH -J d16-1-theta        # job name
#SBATCH -o out_dcmip16-1.o%j  # output and error file name (%j expands to jobID)
#SBATCH -n 1440               # total number of mpi tasks requested
#SBATCH -p regular            # queue (partition) -- normal, development, etc.
#SBATCH -t 01:40:00           # run time (hh:mm:ss)
#SBATCH -A acme               # charge account
#SBATCH --qos=premium         # charge account

EXEC=../../../test_execs/theta-nlev30/theta-nlev30
NCPU=1440

date

cp -f namelist-r50-wet.nl input.nl
srun -n $NCPU $EXEC < input.nl

date
