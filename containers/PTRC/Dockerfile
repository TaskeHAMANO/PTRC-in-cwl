FROM ubuntu:18.04

LABEL maintainer="Shinya Suzuki<sshinya@bio.titech.ac.jp>"
LABEL description="Container for PTRC"

ENV TOOLDIR /opt
# Unarchive PTRC
ADD PTRC1.1.2.tar.gz ${TOOLDIR}

RUN apt-get update && \
    apt-get install -y --no-install-recommends wget \
                                               rsync \
                                               build-essential \
                                               python2.7 \
                                               python2.7-dev \
                                               python-pip \
                                               libpython2.7 \
                                               libpython2.7-dev  && \
    rm -rf /var/lib/apt/lists/*

WORKDIR ${TOOLDIR}
# Install GEM-mapper
RUN wget https://excellmedia.dl.sourceforge.net/project/gemlibrary/gem-library/Binary%20pre-release%203/GEM-binaries-Linux-x86_64-core_i3-20130406-045632.tbz2 && \
    tar -jxf GEM-binaries-Linux-x86_64-core_i3-20130406-045632.tbz2  && \
    rsync -a GEM-binaries-Linux-x86_64-core_i3-20130406-045632/*  /usr/local && \
    cd ${TOOLDIR} && \
    rm -rf GEM-binaries-Linux-x86_64-core_i3-20130406-045632

# Install dependent libraries
RUN pip install setuptools wheel && \
    # Need to install it before biopython
    pip install numpy==1.9.2 && \
    pip install cython==0.19.1 \
                pandas==0.16.1  \
                lmfit==0.8.2  \
                dill==0.2.1 \
                # No description in README, but below libraries are required.
                scipy==0.15.1 \
                biopython==1.65

# Directory to mount index file
RUN mkdir PTRC_INDEX
VOLUME ${TOOLDIR}/PTRC_INDEX
ENV PATH ${PATH}:${TOOLDIR}/PTRC_INDEX

WORKDIR ${TOOLDIR}/PTRC1.1
ENTRYPOINT ["python", "/opt/PTRC1.1/PTRC.py"]
CMD ["--help"]
