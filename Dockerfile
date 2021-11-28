FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
	&& apt-get install -y \
# Required for building
	&& apt-get install -y curl \
	&& apt-get install -y clang \
	&& apt-get install -y flex \
	&& apt-get install -y bison \
	&& apt-get install -y make \
# Build and install wine
	&& curl -L "https://github.com/wine-mirror/wine/archive/refs/tags/wine-6.22.tar.gz" | tar xvz \
	&& cd "wine-wine-6.22" \
	&& export CC=clang \
	&& export CXX=clang \
	&& export CFLAGS="-std=gnu89 -g" \
	&& ./configure --without-x --without-freetype \
	&& make -j4 \
	&& make install \	
# Clean up
	&& apt-get autoremove -y \
		software-properties-common \
	&& apt-get autoclean \
	&& apt-get clean \
	&& apt-get autoremove

VOLUME /wine

WORKDIR /fxc
COPY D3DCompiler_47.dll fxc.exe ./

# We do this to shut up the errors on first run. TODO: Is there a better way?
RUN wine fxc.exe /?; exit 0

ENTRYPOINT ["wine", "/fxc/fxc.exe"]