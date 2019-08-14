# GEOS GCM Fixture
[![CircleCI](https://circleci.com/gh/GEOS-ESM/GEOSgcm.svg?style=svg)](https://circleci.com/gh/GEOS-ESM/GEOSgcm)

## How to build GEOS GCM

### Preliminary Steps

#### Load Build Modules

In your `.bashrc` or `.tcshrc` or other rc file add a line:

##### NCCS (SLES11)

```
module use -a /discover/swdev/gmao_SIteam/modulefiles-SLES11
```

##### NAS
```
module use -a /nobackup/gmao_SIteam/modulefiles
```

##### GMAO Desktops
On the GMAO desktops, the SI Team modulefiles should automatically be
part of running `module avail` but if not, they are in:

```
module use -a /ford1/share/gmao_SIteam/modulefiles
```

Also do this in any interactive window you have. This allows you to get module files needed to correctly checkout and build the model.

Now load the `GEOSenv` module:
```
module load GEOSenv
```
which obtains the latest `git`, `CMake`, and `manage_externals` modules.

#### Obtain the Model

```
git clone git@github.com:GEOS-ESM/GEOSgcm.git
```

---

### Single Step Building of the Model

If all you wish is to build the model, you can run `parallel_build.csh` from a head node. Doing so will checkout all the external repositories of the model and build it. When done, the resulting model build will be found in `build/` and the installation will be found in `install/` with setup scripts like `gcm_setup` and `fvsetup` in `install/bin`.

#### Develop Version of GEOS

The user will notice two files in the main directory: `Externals.cfg` and `Develop.cfg`. The difference between these two is that `Externals.cfg` always refers to stable tested released subrepositories. The `Develop.cfg` points to the `develop` branch of `@GEOSgcm_GridComp` and `@GEOSgcm_App`. This is equivalent in the CVS days of the difference between `Jason-3_1` and `Jason-UNSTABLE`. In order to build the `Develop.cfg` version of the model with `parallel_build.csh` do:
```
parallel_build.csh -develop
```

#### Debug Version of GEOS

To obtain a debug version, you can run `parallel_build.csh -debug` which will build with debugging flags. This will build in `build-Debug/` and install into `install-Debug/`.

---

### Multiple Steps for Building the Model

The steps detailed below are essentially those that `parallel_build.csh` performs for you. Either method should yield identical builds.

##### Checkout externals
```
cd GEOSgcm
checkout_externals
```
###### Checking out develop 
To use the `Develop.cfg` file, run:
```
checkout_externals -e Develop.cfg
```

#### Build the Model

##### Load Compiler, MPI Stack, and Baselibs
On tcsh:
```
source @env/g5_modules
```
or on bash:
```
source @env/g5_modules.sh
```

##### Create Build Directory
We currently do not allow in-source builds of GEOSgcm. So we must make a directory:
```
mkdir build
```
The advantages of this is that you can build both a Debug and Release version with the same clone if desired.

##### Run CMake
CMake generates the Makefiles needed to build the model.
```
cd build
cmake .. -DBASEDIR=$BASEDIR/Linux -DCMAKE_Fortran_COMPILER=ifort -DCMAKE_INSTALL_PREFIX=../install
```
This will install to a directory parallel to your `build` directory. If you prefer to install elsewhere change the path in:
```
-DCMAKE_INSTALL_PREFIX=<path>
```
and CMake will install there.

##### Build and Install with Make
```
make -j6 install
```

### Run the AGCM

Once the model has built successfully, you will have an `install/` directory in your checkout. To run `gcm_setup` go to the `install/bin/` directory and run it there:
```
cd install/bin
./gcm_setup
```
