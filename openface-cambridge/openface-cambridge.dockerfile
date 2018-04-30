FROM ubuntu:16.04
MAINTAINER Lei Chen <lei.chen@liulishuo.com>

RUN apt-get update && \
	apt-get install -y \
	build-essential \
	checkinstall \
	clang-3.7 \
	clang++-3.7 \
	cmake \
	git \
	libavcodec-dev \
	libavformat-dev \
	libboost-all-dev \
	libc++abi-dev \
	libc++-dev \
	libdc1394-22-dev \
	libgtk2.0-dev \
	libjasper-dev \
	libjpeg-dev \
	liblapack-dev \
	libopenblas-dev \
	libpng-dev \
	libswscale-dev \
	libtbb2 \
	libtbb-dev \
	libtiff-dev \
	llvm \
	pkg-config \
	python-dev \
	python-numpy \
	sshfs \
	unzip \
	wget

# OpenCV 3.4.0
RUN wget https://github.com/opencv/opencv/archive/3.4.0.zip && \
	unzip 3.4.0.zip -d /opt && \
	cd /opt/opencv-3.4.0 && \
	mkdir build && \
	cd build && \
	cmake -D CMAKE_BUILD_TYPE=RELEASE \
	-D CMAKE_INSTALL_PREFIX=/usr/local \
	-D WITH_TBB=ON -D BUILD_SHARED_LIBS=OFF .. && \
	make -j2 && \
	make install

# OpenFace v1.0
RUN cd /opt && \
	git clone https://github.com/TadasBaltrusaitis/OpenFace.git && \
	cd OpenFace && \
	# git reset --hard cdd258330f2d3f121005ab3ed0233c9442402afb && \
	mkdir build && \
	cd build && \
    cmake -D CMAKE_BUILD_TYPE=RELEASE \
	-D CMAKE_INSTALL_PREFIX=/usr/local \
	-D WITH_TBB=ON -D BUILD_SHARED_LIBS=OFF .. && \
	make -j2 && \
	make install

# install editors
RUN apt-get install -y \
	vim

# clean up
RUN rm 3.4.0.zip

# set working directory
WORKDIR /opt/OpenFace/build/bin

# internal use only
# copy feature extraction script over
# COPY ./start_feature_extraction.sh /opt/OpenFace/build/bin
