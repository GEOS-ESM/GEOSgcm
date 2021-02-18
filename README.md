# GEOS GCM Fixture

## CI Status

| CI Provider | Status |
| ----------- | ------ |
| CircleCI    | [![CircleCI](https://circleci.com/gh/GEOS-ESM/GEOSgcm.svg?style=svg)](https://circleci.com/gh/GEOS-ESM/GEOSgcm) |
| AWS CodeBuild | ![CodeBuild](https://codebuild.us-east-1.amazonaws.com/badges?uuid=eyJlbmNyeXB0ZWREYXRhIjoiZitEZE1kODFtUUhuZU5tN1pDbHZvbDlEQUEwNWR0a2JCM1F1MmlTaWZYV1JxNWIxMjZDSThOUi9mUDJKSVBuaEVRa1FxV2FncitOcExyemNaWFFIbjVrPSIsIml2UGFyYW1ldGVyU3BlYyI6IlBudmE3N1A0MTNNR3ZhNVoiLCJtYXRlcmlhbFNldFNlcmlhbCI6MX0%3D&branch=main) |
| GitHub | ![GitHub](https://github.com/GEOS-ESM/GEOSgcm/workflows/Build%20Tests/badge.svg) |

## How to build GEOS GCM

### Preliminary Steps

#### Load Build Modules

In your `.bashrc` or `.tcshrc` or other rc file add a line:

##### NCCS
```
module use -a /discover/swdev/gmao_SIteam/modulefiles-SLES12
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
which obtains the latest `git`, `CMake`, and `mepo` modules.

#### Obtain the Model

```
git clone git@github.com:GEOS-ESM/GEOSgcm.git
```

---

### Single Step Building of the Model

If all you wish is to build the model, you can run `parallel_build.csh` from a head node. Doing so will checkout all the external repositories of the model and build it. When done, the resulting model build will be found in `build/` and the installation will be found in `install/` with setup scripts like `gcm_setup` and `fvsetup` in `install/bin`.

#### Develop Version of GEOS GCM

`parallel_build.csh` provides a special flag for checking out the
development branches of GEOSgcm_GridComp and GEOSgcm_App. If you run:

```
parallel_build.csh -develop
```
then `mepo` will run:

```
mepo develop GEOSgcm_GridComp GEOSgcm_App
```

#### Debug Version of GEOS GCM

To obtain a debug version, you can run `parallel_build.csh -debug` which will build with debugging flags. This will build in `build-Debug/` and install into `install-Debug/`.

---

### Multiple Steps for Building the Model

The steps detailed below are essentially those that `parallel_build.csh` performs for you. Either method should yield identical builds.

#### Mepo

The GEOS GCM is comprised of a set of sub-repositories. These are
managed by a tool called [mepo](https://github.com/GEOS-ESM/mepo). To
clone all the sub-repos, you can run `mepo clone` inside the fixture:

```
cd GEOSgcm
mepo clone
```

The first command initializes the multi-repository and the second one
clones and assembles all the sub-repositories according to
`components.yaml`

#### Checking out develop branches of GEOSgcm_GridComp and GEOSgcm_App

To get development branches of GEOSgcm_GridComp and GEOSgcm_App (a la
the `-develop` flag for `parallel_build.csh`, one needs to run the
equivalent `mepo` command. As mepo itself knows (via `components.yaml`) what the development branch of each
subrepository is, the equivalent of `-develop` for `mepo` is to
checkout the development branches of GEOSgcm_GridComp and GEOSgcm_App:
```
mepo develop GEOSgcm_GridComp GEOSgcm_App
```

This must be done *after* `mepo clone` as it is running a git command in
each sub-repository.

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
make -jN install
```
where `N` is the number of parallel processes. On discover head nodes, this should only be as high as 2 due to limits on the head nodes. On a compute node, you can set `N` has high as you like, though 8-12 is about the limit of parallelism in our model's make system.

### Run the AGCM

Once the model has built successfully, you will have an `install/` directory in your checkout. To run `gcm_setup` go to the `install/bin/` directory and run it there:
```
cd install/bin
./gcm_setup
```
