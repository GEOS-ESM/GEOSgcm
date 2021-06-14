# GEOS GCM Fixture

## CI Status

| CI Provider | Status |
| ----------- | ------ |
| CircleCI    | [![CircleCI](https://circleci.com/gh/GEOS-ESM/GEOSgcm.svg?style=svg)](https://circleci.com/gh/GEOS-ESM/GEOSgcm) |
| AWS CodeBuild | ![CodeBuild](https://codebuild.us-east-1.amazonaws.com/badges?uuid=eyJlbmNyeXB0ZWREYXRhIjoiZitEZE1kODFtUUhuZU5tN1pDbHZvbDlEQUEwNWR0a2JCM1F1MmlTaWZYV1JxNWIxMjZDSThOUi9mUDJKSVBuaEVRa1FxV2FncitOcExyemNaWFFIbjVrPSIsIml2UGFyYW1ldGVyU3BlYyI6IlBudmE3N1A0MTNNR3ZhNVoiLCJtYXRlcmlhbFNldFNlcmlhbCI6MX0%3D&branch=main) |
| GitHub | ![GitHub](https://github.com/GEOS-ESM/GEOSgcm/workflows/Build%20Tests/badge.svg) |

## Current State of GEOSgcm Subrepos

| Repository                                                                     | Version                                                                                             |
| ----------                                                                     | -------                                                                                             |
| [CPLFCST_Etc](https://github.com/GEOS-ESM/CPLFCST_Etc)                         | [v1.0.1](https://github.com/GEOS-ESM/CPLFCST_Etc/releases/tag/v1.0.1)                               |
| [ecbuild](https://github.com/GEOS-ESM/ecbuild)                                 | [geos/v1.0.6](https://github.com/GEOS-ESM/ecbuild/releases/tag/geos%2Fv1.0.6)                       |
| [ESMA_cmake](https://github.com/GEOS-ESM/ESMA_cmake)                           | [v3.5.0](https://github.com/GEOS-ESM/ESMA_cmake/releases/tag/v3.5.0)                                |
| [ESMA_env](https://github.com/GEOS-ESM/ESMA_env)                               | [v3.3.0](https://github.com/GEOS-ESM/ESMA_env/releases/tag/v3.3.0)                                  |
| [FMS](https://github.com/GEOS-ESM/FMS)                                         | [geos/2019.01.02+noaff.7](https://github.com/GEOS-ESM/FMS/releases/tag/geos%2F2019.01.02%2Bnoaff.7) |
| [FVdycoreCubed_GridComp](https://github.com/GEOS-ESM/FVdycoreCubed_GridComp)   | [v1.2.15](https://github.com/GEOS-ESM/FVdycoreCubed_GridComp/releases/tag/v1.2.15)                  |
| [geos-chem](https://github.com/GEOS-ESM/geos-chem)                             | [geos/v13.0.0-rc1](https://github.com/GEOS-ESM/geos-chem/releases/tag/geos%2Fv13.0.0-rc1)           |
| [GEOSchem_GridComp](https://github.com/GEOS-ESM/GEOSchem_GridComp)             | [v1.6.0](https://github.com/GEOS-ESM/GEOSchem_GridComp/releases/tag/v1.6.0)                         |
| [GEOSgcm_App](https://github.com/GEOS-ESM/GEOSgcm_App)                         | [v1.5.2](https://github.com/GEOS-ESM/GEOSgcm_App/releases/tag/v1.5.2)                               |
| [GEOSgcm_GridComp](https://github.com/GEOS-ESM/GEOSgcm_GridComp)               | [v1.12.3](https://github.com/GEOS-ESM/GEOSgcm_GridComp/releases/tag/v1.12.3)                        |
| [GFDL_atmos_cubed_sphere](https://github.com/GEOS-ESM/GFDL_atmos_cubed_sphere) | [geos/v1.1.6](https://github.com/GEOS-ESM/GFDL_atmos_cubed_sphere/releases/tag/geos%2Fv1.1.6)       |
| [GMAO_Shared](https://github.com/GEOS-ESM/GMAO_Shared)                         | [v1.4.3](https://github.com/GEOS-ESM/GMAO_Shared/releases/tag/v1.4.3)                               |
| [GOCART](https://github.com/GEOS-ESM/GOCART)                                   | [v1.0.1](https://github.com/GEOS-ESM/GOCART/releases/tag/v1.0.1)                                    |
| [HEMCO](https://github.com/GEOS-ESM/HEMCO)                                     | [geos/v2.2.1](https://github.com/GEOS-ESM/HEMCO/releases/tag/geos%2Fv2.2.1)                         |
| [MAPL](https://github.com/GEOS-ESM/MAPL)                                       | [v2.7.0](https://github.com/GEOS-ESM/MAPL/releases/tag/v2.7.0)                                      |
| [MOM5](https://github.com/GEOS-ESM/MOM5)                                       | [geos/5.1.0+1.1.1](https://github.com/GEOS-ESM/MOM5/releases/tag/geos%2F5.1.0%2B1.1.1)              |
| [MOM6](https://github.com/GEOS-ESM/MOM6)                                       | [geos/v2.0.1](https://github.com/GEOS-ESM/MOM6/releases/tag/geos%2Fv2.0.1)                          |
| [NCEP_Shared](https://github.com/GEOS-ESM/NCEP_Shared)                         | [v5.29.0](https://github.com/GEOS-ESM/NCEP_Shared/releases/tag/v5.29.0)                             |
| [UMD_Etc](https://github.com/GEOS-ESM/UMD_Etc)                                 | [v1.0.4](https://github.com/GEOS-ESM/UMD_Etc/releases/tag/v1.0.4)                                   |

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

On GitHub, there are three ways to clone the model: SSH, HTTPS, or GitHub CLI.
The first two are "git protocols" which determine how `git` communicates with
GitHub: either through https or ssh. (The latter is a CLI that uses either ssh or
https protocol underneath.)

For developers of GEOS, the SSH git protocol is recommended as it can avoid some issues if
[two-factor authentication
(2FA)](https://docs.github.com/en/github/authenticating-to-github/securing-your-account-with-two-factor-authentication-2fa)
is enabled on GitHub.

##### SSH

To clone the GEOSgcm using the SSH url (starts with `git@github.com`), you run:
```
git clone git@github.com:GEOS-ESM/GEOSgcm.git
```

###### Permission denied (publickey)

If this is your first time using GitHub with any SSH URL, you might get this
error:
```
Permission denied (publickey).
fatal: Could not read from remote repository.

Please make sure you have the correct access rights
and the repository exists.
```

If you do see this, you need to [upload an ssh
key](https://docs.github.com/en/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account)
to your GitHub account. This needs to be done on any machine that you want to
use the SSH URL through.


##### HTTPS

To clone the model through HTTPS you run:

```
git clone https://github.com/GEOS-ESM/GEOSgcm.git
```

Note that if you use the HTTPS URL and have 2FA set up on GitHub, you will need
to use [personal access
tokens](https://docs.github.com/en/github/authenticating-to-github/accessing-github-using-two-factor-authentication#authenticating-on-the-command-line-using-https)
as a password.

##### GitHub CLI

You can also use the [GitHub CLI](https://cli.github.com/) with:
```
gh repo clone GEOS-ESM/GEOSgcm
```

Note that when you first use `gh`, it will ask what your preferred git protocol
is (https or ssh) to use "underneath". The caveats above will apply to whichever
you choose.

---

### Single Step Building of the Model

If all you wish is to build the model, you can run `parallel_build.csh` from a head node. Doing so will checkout all the external repositories of the model and build it. When done, the resulting model build will be found in `build/` and the installation will be found in `install/` with setup scripts like `gcm_setup` and `fvsetup` in `install/bin`.

#### Develop Version of GEOS GCM

`parallel_build.csh` provides a special flag for checking out the
development branches of GEOSgcm_GridComp, GEOSgcm_App, and GMAO_Shared. If you run:

```
parallel_build.csh -develop
```
then `mepo` will run:

```
mepo develop GEOSgcm_GridComp GEOSgcm_App GMAO_Shared
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

#### Checking out develop branches of GEOSgcm_GridComp, GEOSgcm_App, and GMAO_Shared

To get development branches of GEOSgcm_GridComp, GEOSgcm_App, and GMAO_Shared (a la
the `-develop` flag for `parallel_build.csh`, one needs to run the
equivalent `mepo` command. As mepo itself knows (via `components.yaml`) what the development branch of each
subrepository is, the equivalent of `-develop` for `mepo` is to
checkout the development branches of GEOSgcm_GridComp, GEOSgcm_App, and GMAO_Shared:
```
mepo develop GEOSgcm_GridComp GEOSgcm_App GMAO_Shared
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

### Run the GCM

Once the model has built successfully, you will have an `install/` directory in your checkout. To run `gcm_setup` go to the `install/bin/` directory and run it there:
```
cd install/bin
./gcm_setup
```
