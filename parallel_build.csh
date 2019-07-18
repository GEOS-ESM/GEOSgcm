#!/bin/tcsh -f
#------------------------------------------------------------------------
# name: parallel_build.csh
# purpose: A small stub routine that calls @env/build.csh
#------------------------------------------------------------------------
set name = $0
set scriptname = $name
set BUILD_LOG_DIR = BUILD_LOG_DIR

# change to src directory, if not already there
#----------------------------------------------
if ($name != $name:t) then
   set scriptname = $name:t
   cd $name:h
endif
set srcdir = `pwd`
setenv ESMADIR $srcdir

if (! -d ${ESMADIR}/@env) then
   if ($?PBS_JOBID || $?SLURM_JOBID) then
      echo " checkout_externals must be run!"
      echo " This requires internet access but you are on a compute node"
      echo " Please run from a head node"
      exit 1
   else
      echo " Running checkout_externals"
      checkout_externals
   endif
endif

if ( -d ${ESMADIR}/@env ) then
   ${ESMADIR}/@env/build.csh -esmadir $ESMADIR $argv
endif

