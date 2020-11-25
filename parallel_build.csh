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

# Save the original argv because I'm not a good
# tcsh script maker
set origargv = "$argv"

setenv DEVELOP FALSE

while ($#argv)
   if ("$1" == "-develop") then
      setenv DEVELOP TRUE
   endif

   shift
end

if (! -d ${ESMADIR}/@env) then
   if ($?PBS_JOBID || $?SLURM_JOBID) then
      echo " mepo clone must be run!"
      echo " This requires internet access but you are on a compute node"
      echo " Please run from a head node"
      exit 1
   else
      echo "Running mepo initialization"
      mepo init
      mepo clone
      if ( "$DEVELOP" == "TRUE" ) then
         echo "Checking out development branches of GEOSgcm_GridComp and GEOSgcm_App"
         mepo develop GEOSgcm_GridComp GEOSgcm_App
      endif
   endif
else
   if ( "$DEVELOP" == "TRUE" ) then
      echo "Checking out development branches of GEOSgcm_GridComp and GEOSgcm_App"
      mepo develop GEOSgcm_GridComp GEOSgcm_App
   endif
endif

# Now reset argv
set argv = "$origargv"

if ( -d ${ESMADIR}/@env ) then
   ${ESMADIR}/@env/build.csh -esmadir $ESMADIR $argv
endif

