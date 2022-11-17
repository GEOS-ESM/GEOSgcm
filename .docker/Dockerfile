# GEOSgcm Dockerfile

ARG osversion
ARG imagename
ARG baselibversion
ARG bcsversion
ARG mpiname
ARG mpiversion
ARG compilername
ARG compilerversion

ARG BASE_IMAGE=gmao/${osversion}-${imagename}:${baselibversion}-${mpiname}_${mpiversion}-${compilername}_${compilerversion}-bcs_${bcsversion}
FROM ${BASE_IMAGE}

ARG gcmversion

RUN git clone -b ${gcmversion} https://github.com/GEOS-ESM/GEOSgcm.git /GEOSgcm-src && \
    cd /GEOSgcm-src && \
    mepo clone && \
    mkdir build && \
    cd build && \
    cmake .. -DCMAKE_INSTALL_PREFIX=/GEOSgcm/install -DBASEDIR=$BASEDIR/Linux -DUSE_F2PY=OFF -DCMAKE_Fortran_COMPILER=$FC -DCMAKE_C_COMPILER=$CC -DCMAKE_CXX_COMPILER=$CXX && \
    make -j $(nproc) install/strip && \
    cd / && \
    rm -rf /GEOSgcm-src
